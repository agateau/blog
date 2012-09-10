import QtQuick 1.0

Rectangle {
    width: 200
    height: 150

    Rectangle {
        width: 10
        height: 40
        color: "green"
        anchors.centerIn: parent

        Text {
            anchors.centerIn: parent
            text: "Hello World"
        }
    }
}
