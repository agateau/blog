import QtQuick 1.0

/// ancres2
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

/// ancres3
    //...
    Rectangle {
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topLeftRect.bottom
        width: 40
        height: 40
    }

    Rectangle {
        color: "blue"
        anchors.left: topLeftRect.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: bottomRect.verticalCenter
        width: 40
    }
    //...
/// footer
}
