import QtQuick 1.0

Rectangle {
    width: 200
    height: 100
    color: "#789"

    property int margin: 12

    Item {
        anchors.fill: parent
        anchors.margins: margin

        CalcInput {
            id: calcInput
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Button {
            id: resetButton
            text: "Reset"
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            onClicked: {
                calcInput.text = "";
            }
        }

        Button {
            text: "="
            anchors.bottom: parent.bottom
            anchors.right: resetButton.left
            anchors.rightMargin: margin

            onClicked: {
                calcInput.text = eval(calcInput.text);
            }
        }
    }
}
