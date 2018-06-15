pub_date: 2018-06-15 19:12:10 +01:00
public: true
tags: [qt, qml, pko]
title: Working around ListModel limitations

When you write code in QML, [ListModel][] is a handy class to quickly populate a list with data. It has a serious limitation though: the values of its elements cannot be the result of a function. This means you cannot write this:

[ListModel]: http://doc.qt.io/qt-5.9/qml-qtqml-models-listmodel.html

    import QtQuick 2.9
    import QtQuick.Window 2.2

    Window {
        visible: true

        ListModel {
            id: speedModel
            ListElement {
                name: "Turtle"
                speed: slowSpeed()
            }
            ListElement {
                name: "Rabbit"
                speed: highSpeed()
            }
        }

        Column {
            Repeater {
                model: speedModel
                Text {
                    text: model.name + " " + model.speed
                }
            }
        }

        function slowSpeed() {
            return 12;
        }

        function highSpeed() {
            return 42;
        }
    }

Running this will fail with that error message: "ListElement: cannot use script for property value".

<!-- break -->

## A first workaround: use a JavaScript array

The first workaround to this limitation I came up with was to replace the ListModel with a JavaScript array, like this:

    import QtQuick 2.9
    import QtQuick.Window 2.2

    Window {
        visible: true

        property var speedModel: [
            {
                name: "Turtle",
                speed: slowSpeed()
            },
            {
                name: "Rabbit",
                speed: highSpeed()
            }
        ]

        Column {
            Repeater {
                model: speedModel
                Text {
                    property var element: speedModel[model.index]
                    text: element.name + " " + element.speed
                }
            }
        }

        function slowSpeed() {
            return 12;
        }

        function highSpeed() {
            return 42;
        }
    }

This works fine, but has two limitations.

First limitation: you can't use the model as usual in your delegate because `model.index` is the only piece of information available, hence the need for the `element` property (Actually, I wish the variable representing the data inside a delegate were always called `element` instead of `model`, but that's another story...)

Second limitation: you can't manipulate the data afterwards. If you add an element to the array, the view is not going to display it.

## Second workaround, initialize ListModel from a JavaScript array

Instead of passing a JavaScript array to our view, this workaround uses a ListModel, but initializes it using JavaScript:

    import QtQuick 2.9
    import QtQuick.Window 2.2
    import QtQuick.Controls 2.2

    Window {
        visible: true

        ListModel {
            id: speedModel
            Component.onCompleted: {
                [
                    {
                        name: "Turtle",
                        speed: slowSpeed()
                    },
                    {
                        name: "Rabbit",
                        speed: highSpeed()
                    }
                ].forEach(function(e) { append(e); });
            }
        }

        Column {
            Repeater {
                model: speedModel
                Text {
                    text: model.name + " " + model.speed
                }
            }
            Button {
                text: "Add"
                onClicked: {
                    speedModel.append({name: "Bird", speed: 60});
                }
            }
        }

        function slowSpeed() {
            return 12;
        }

        function highSpeed() {
            return 42;
        }
    }

This approach avoids the two limitations of the previous workaround: the view can use the model as usual, which is nice especially if the model and the view are not defined in the same file. And we can modify the model as we usually do.

I tried to simplify the `forEach()` call to `forEach(append)` but hit another error: "QML ListModel: append: value is not an object". Don't know why this happens, if you have the answer I would love to hear it.

You can make the declaration less verbose by representing elements using arrays instead of objects in `Component.onCompleted`, like this:

    Component.onCompleted: {
        [
            ["Turtle", slowSpeed()],
            ["Rabbit", highSpeed()],
        ].forEach(function(element) {
            append({
                name: element[0],
                speed: element[1]
            });
        });
    }

It's an interesting approach if you have many rows and few columns. You still get named fields in the view, so you don't loose any readability.

That's it for this article, I hope it was useful! Here are the source files if you want to play with them: [fail.qml](fail.qml), [jsarray.qml](jsarray.qml) and [listmodel-js-init.qml](listmodel-js-init.qml).
