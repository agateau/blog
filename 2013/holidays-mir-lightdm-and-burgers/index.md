pub_date: 2013-03-18 23:57:45 +01:00
public: true
tags: [KDE, Mir, BurgerParty]
title: "Holidays, Mir and... burgers"
summary: Finding a coding distraction when free software news are depressing
    

On the second week of March, I went for some vacations in the mountains. I came
back tired but refreshed.

And then I read the free software news to catch up on what happened while I was
away.

I am not going to comment on whether it made sense to create Mir instead of
working on Wayland. What actually happened is I was left flabbergasted by such a
waste of energy from some people whose smartness is only surpassed by their
unwillingness to compromise and cooperate, on all sides.

My mind was still in the mountains and I didn't feel like diving into yet
another uprising in our geeky, [Whoville][]-sized, world, didn't want to pick a side
and argue endlessly.

Feeling a bit depressed, I decided to try something different. The family now
owns a Nexus 7 tablet. The kids (and their parents) enjoy playing games on it.
You may remember I wrote [games][plouf] in the past.  I thought it would be a
nice change to write an Android game, I also liked the idea of being able to get
people I know to try my stuff.

There was only one problem with this idea: I am not fond of Java. I looked if it
were possible to use Python to write Android games, but it does not seem to be
doable right now. I considered using the [NDK][] instead, so that I could use
C++, but in the end decided I should start with the more widely-used tools. I
downloaded the Android Developer Tools and settled for the [libgdx][] game
development library.

I decided to start small, with a "Burger" game. It currently looks like this:

.. thumbimg:: burgerparty.png
    :thumbsize: 400
    :alt: Burger Party

It's been only a week of evening hacking, so it is a very early version. I
really enjoy the process of working on this little project though, it does a good job
at keeping my mind busy with something positive.

Some observations on the technical side:

- Java is actually not that bad. My last adventure with this language was before
  the introduction of generics. Generics makes the language more enjoyable.
- Java is not that bad, but I miss Qt signal-slot system. Creating event classes and
  writing the same code over and over to register/unregister listeners gets old
  very quickly. I wrote a crude signal-like class to make life easier.
- LibGDX is a lot of fun, even if the doc is way behind Qt or the KDE library
  docs. Being able to run your game on your development machine without going
  through an emulator is a huge time-saver.
- Writing Java with Eclipse is almost too easy. The helpers to add missing
  imports, the auto-completion and the continuous building are amazing. The
  refactoring tools are also impressive.

[Whoville]: https://en.wikipedia.org/wiki/Whoville
[plouf]: http://agateau.com/2013/01/22/plouf
[ndk]: http://developer.android.com/tools/sdk/ndk/index.html
[libgdx]: http://libgdx.badlogicgames.com/
