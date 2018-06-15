import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

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
