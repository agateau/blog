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
