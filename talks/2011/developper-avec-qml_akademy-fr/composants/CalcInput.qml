import QtQuick 1.0

Rectangle {
    property alias text: input.text

    height: input.height + 10
    border.color: "black"
    radius: 3
    color: "white"

    TextInput {
        id: input
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 5
    }
}
