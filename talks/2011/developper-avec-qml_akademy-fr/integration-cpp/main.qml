import QtQuick 1.0

Rectangle {
    width: 400
    height: 300

    property alias ballX: ball.x
    property alias ballY: ball.y

    Rectangle {
        id: ball
        radius: mainWindow.radius
        width: radius * 2
        height: radius * 2
        color: "blue"

        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }
}
