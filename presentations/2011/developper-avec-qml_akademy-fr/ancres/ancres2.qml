import QtQuick 1.0

/// main
Rectangle {
    width: 250
    height: 200

    Rectangle {
        id: topLeftRect
        color: "red"
        anchors.left: parent.left
        anchors.top: parent.top
        width: 40
        height: 40
    }

    Rectangle {
        id: bottomRect
        color: "green"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 40
    }
}
