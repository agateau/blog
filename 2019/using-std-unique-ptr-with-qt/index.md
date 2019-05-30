pub_date: 2019-05-30 20:29:56 +01:00
public: true
tags: [qt, c++, pko]
title: Using std::unique_ptr with Qt


## Qt memory handling

Qt has a well established way to handle memory management: any QObject-based instance can be made a child of another QObject instance. When the parent instance is deleted it deletes all its children. Simple and efficient.

When a Qt method takes a QObject pointer one can rely on the documentation to know if the function takes ownership of the pointer. Same thing for functions returning a QObject pointer.

## What the rest of the world does

This is very Qt specific. In the rest of the C++ world, object ownership is more often managed through smart pointers like `std::unique_ptr` and `std::shared_ptr`.

I am used to the Qt way, but I like the harder to misuse and self documenting aspect of the `unique_ptr` way. Look at this simple function:

    Engine* createEngine();

With this signature we have no way to know if you are expected to delete the new engine. And the compiler cannot help us. This code builds:

	{
	    Engine* engine = createEngine();
	    engine->start();
	    // Memory leak!
	}

With this signature, on the other hand:

    std::unique_ptr<Engine> createEngine();

It is clear and hard to ignore that ownership is passed to the caller. This won't build:

	{
	    Engine* engine = createEngine();
	    engine->start();
	}

But this builds and does not leak:

	{
	    std::unique_ptr<Engine> engine = createEngine();
	    engine->start();
	    // No leak, Engine instance is deleted when going out of scope
	}

(And we can use `auto` to replace the lengthy `std::unique_ptr<Engine>` declaration)

<!-- break -->

We can also use this for "sink functions": declaring a function argument as `std::unique_ptr` makes it unambiguous that the function takes ownership of it.

Using `std::unique_ptr` for member variables brings similar benefits, but one point I really like is how it makes the class definition more self-documenting. Consider this class:

	class Car {
	    /*...*/
	    World* mWorld;
	    Engine* mEngine;
	}

Does `Car` owns `mWorld`, `mEngine`, both, none? We can guess, but we can't really know. Only the class documentation or our knowledge of the code base could tell us that `Car` owns `mEngine` but does not own `mWorld`.

On the other hand, if we work on a code base where all owned objects are `std::unique_ptr` and all "borrowed" objects are raw pointers, then this class would be declared like this:

	class Car {
	    /*...*/
	    World* mWorld;
	    std::unique_ptr<Engine> mEngine;
	}

This is more expressive.

### Forward declarations

We need to be careful with forward declarations. The following code won't build:

Car.h:

	#include <memory>
	
	class Engine;
	
	class Car {
	public:
	    Car():
	private:
	    std::unique_ptr<Engine> mEngine;
	};

Car.cpp:

	#include "Car.h"
	#include "Engine.h"
	
	Car::Car()
	    : mEngine(std::make_unique<Engine>()) {
	}

main.cpp:

	#include "Car.h"
	
	int main() {
	    Car car;
	    return 0;
	}

The compiler fails to build "main.cpp". It complains it cannot delete `mEngine` because the `Engine` class is incomplete. This happens because we have not declared a destructor in `Car`, so the compiler tries to generate one when building "main.cpp", and since "main.cpp" does not include "Engine.h", the `Engine` class is unknown there.

To solve this we need to declare `Car` destructor and tell the compiler to generate its implementation in `Car` implementation:

Car.h:

	#include <memory>
	
	class Engine;
	
	class Car {
	    Car();
	    ~Car(); // <- Destructor declaration
	private:
	    std::unique_ptr<Engine> mEngine;
	};

Car.cpp:

	#include "Car.h"
	#include "Engine.h"
	
	Car::Car()
	    : mEngine(std::make_unique<Engine>()) {
	}
	
	Car::~Car() = default; // <- Destructor "definition"

## Using std::unique_ptr with Qt code

I wanted to experiment with using `unique_ptr` instead of the Qt parent-child system in a real project, so I decided to do so on [Lovi][], a Qt-based log file viewer I am working on. It works out well, but there are a few pitfalls to be aware of.

[Lovi]: https://github.com/agateau/lovi

### Double deletions

If your class owns a QObject through a `unique_ptr`, be careful that the QObject parent is not deleted *before* your class, as it will delete your QObject, so when you reach your class destructor, `unique_ptr` will try to delete the already deleted QObject.

This also happens if you use a `unique_ptr` for a `QDialog` with the `Qt::WA_DeleteOnClose` attribute set.

### Get used to calling `.get()`

Another change compared to using raw pointers is that every time you pass the object to a method which takes a raw pointer, you need to call `.get()`. So for example connecting the `Engine::started()` signal to our `Car` instance would be done like this:

	connect(mEngine.get(), &Engine::started, this, &Car::onEngineStarted);

This is a bit annoying but again, it makes it explicit that you are "lending" your object to another function.

## What about `QScopedPointer`?

Qt comes with `QScopedPointer`, which is very similar to `std::unique_ptr`. You might already be using it. Why should you use `unique_ptr` instead?

The main difference between these two is that `QScopedPointer` lacks move semantics. It makes sense since it has been created to work with C++98, which does not have move semantics.

This means it is more cumbersome to implement sink functions with it. Here is an example.

Suppose we want to create a function to shred a car. The Car instance received by this function should not be usable once it has been called, so we want to make it a sink function, like this:

	void shredCar(std:unique_ptr<Car> car) {
	    // Shred that car
	}

The compiler rightfully prevents us from calling `shredCar()` like this:

	auto car = std::make_unique<Car>();
	shredCar(car);

Instead we have to write:

	auto car = std::make_unique<Car>();
	shredCar(std::move(car));

This makes it explicit that `car` no longer points to a valid instance. Now lets write `shredCar()` using `QScopedPointer` instead:

	void shredCar(QScopedPointer<Car> car) {
	    // Shred that car
	}

Since `QScopedPointer` does not support move, we can't write:

	shredCar(std::move(car));

Instead we have to write this:

	shredCar(QScopedPointer<Car>(car.take()));

which is less readable, and less efficient since we create a new temporary QScopedPointer.

Other than its name being more Qt-like, `QScopedPointer` has no advantages compared to `std::unique_ptr`.

## Borrowed pointers

Following the guideline of using `std::unique_ptr<>` for pointers we own means that we should only use raw pointers for "borrowed" objects: objects owned by someone else, which have been passed to us (yes, this sounds very [Rust][] like).

To make things even more explicit, I am contemplating the idea of creating a `borrowed_ptr<T>` pointer. This pointer would not do anything more than a raw pointer, but it would make it clear that the code using the pointer does not own the object.

[Rust]: https://rust-lang.org

Taking our `Car` example again, the class definition would look like this:

	class Car {
	    /*...*/
	    borrowed_ptr<World> mWorld;
	    std::unique_ptr<Engine> mEngine;
	}

Such a pointer would make code more readable at the cost of verbosity. It could also be really useful when generating bindings for other languages. What do you think?

## Conclusion

I believe using `std::unique_ptr` can help make your code more readable and robust. Consider using it instead of raw pointers. Not only for local variables, but also for function arguments, return values and member classes.

And if you use `QScopedPointer`, you can switch to `std::unique_ptr`, it has a few advantages and no drawbacks.
