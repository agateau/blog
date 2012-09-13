import QtQuick 1.0

Item {
    id: button
    property string text
    signal clicked

    width: Math.max(buttonText.width + 12, 50)
    height: buttonText.height + 6

    Rectangle {
        anchors.fill: parent
        radius: 10
        height: 2 * radius
        border.color: "black"
        color: {
            if (mouseArea.pressed) {
                return "#abc";
            } else if (mouseArea.containsMouse) {
                return "#eff";
            } else {
                return "#def";
            }
        }

        Text {
            id: buttonText
            anchors.centerIn: parent
            text: button.text
        }

        MouseArea {
            id: mouseArea
            hoverEnabled: true
            anchors.fill: parent
            onClicked: button.clicked()
        }
    }
}
