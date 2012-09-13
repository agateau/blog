import QtQuick 1.0

Rectangle {
    width: 400
    height: 300

    Rectangle {
        width: 40
        height: 40
        anchors.centerIn: parent
        color: area.pressed ? "green" : "red"

        MouseArea {
            id: area
            anchors.fill: parent
        }
    }
}
