import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

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
        Button {
            text: "Add (does not work)"
            onClicked: {
                speedModel.push({name: "Bird", speed: 60});
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
