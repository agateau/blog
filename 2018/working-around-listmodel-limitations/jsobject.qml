import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true

    property var speedModel: {
        ListElement {
            name: Turtle
            speed: slowSpeed()
        }
        ListElement {
            name: Rabbit
            speed: highSpeed()
        }
    }

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
