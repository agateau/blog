pub_date: 2013-01-14 22:15:54 +01:00
public: true
tags: [qml, doxygen, python, doxyqml]
title: Introducing Doxyqml
summary: This article presents Doxyqml, a tool which makes it possible to document QML classes with Doxygen.

If you are a developer, chances are you have already read a documentation
created with Doxygen. [Doxygen][doxygen] is a widespread tool to produce
documentation from source code. We use it in KDE to document our C++ libraries
on [api.kde.org][].

We use [QML][qml] more and more within KDE, especially in the Plasma world:
on the desktop, where many existing Plasma applets have already been
rewritten in QML, and on touch devices with Plasma Active, which is 100% QML.
To maintain consistency, we are building a set of reusable
QML components, and those components need a good documentation

Unfortunately, Doxygen does not support QML out of the box. That is the reason
why I created Doxyqml.

Doxyqml is a QML input filter for Doxygen, it uses Doxygen input filter
mechanism to turn QML into code which Doxygen can process.

Doxyqml has been deployed on api.kde.org. It is currently used to document
the [QML Plasma components][plasma-components-dox] which are shipped with
kde-runtime.

## QML specificities

In the spirit of Doxygen, Doxyqml tries to extract as much as possible from the
code itself, to avoid duplication. For example, a property can be documented
this way:

    Item {
        /// The text color of the element
        property color textColor
    }

Doxyqml will correctly extract the type of the `textColor` property as `color`.

But what if the property is an alias? Something like this:

    Item {
        /// The text color of the element
        property alias foregroundColor: innerText.color

        Text {
            id: innerText
        }
    }

Doxyqml does not resolve aliases. In this case you need to help it a bit by
providing the type. You can do so with a `type:<name>` annotation:

    Item {
        /// type:color The text color of the widget
        property alias foregroundColor: innerText.color

        Text {
            id: innerText
        }
    }

Types annotations are also used to document functions. Arguments and return
values of QML functions are untyped, so you must use the `type:<name>`
syntax to document them. Here is an example from the README:

    /**
     * Create a user
     * @param type:string firstname User firstname
     * @param type:string lastname User lastname
     * @param type:int User age
     * @return type:User The User object
     */
    function createUser(firstname, lastname, age);

Signal parameters, on the other hand, are completely typed. Doxyqml will
extract the parameter types for you.

## What about QDoc?

Qt QML components are documented with [QDoc][qdoc], a tool similar to Doxygen,
created by Qt developers themselves. Using QDoc could have been an option, but
doing it so would have forced us to either:

- Use Doxygen for C++ code and QDoc for QML. But using two different tools makes it
difficult to produce a consistent documentation.

Or

- Migrate our existing C++ documentation to use QDoc. Going that way meant giving
up on Doxygen features we use which QDoc lacks, such as source code browsing or
class diagrams.

## Get it

You can get Doxyqml from its [project page][doxyqml].

.. flattr :: http://flattr.com/thing/1101052/Introducing-Doxyqml

[qml]: http://qt.digia.com/Product/qt-quick/
[doxygen]: http://doxygen.org
[api.kde.org]: http://api.kde.org
[doxyqml]: /projects/doxyqml
[plasma-components-dox]: http://api.kde.org/4.x-api/kde-runtime-apidocs/
[qdoc]: http://doc-snapshot.qt-project.org/qdoc3/index.html
