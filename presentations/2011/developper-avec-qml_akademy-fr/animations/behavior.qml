import QtQuick 1.0

Rectangle {
    width: 400
    height: 300

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
    }

    Rectangle {
        width: 100
        height: 20
        radius: height / 2
        color: "blue"
        x: mouseArea.mouseX - width / 2
        y: parent.height - height * 2

        Behavior on x {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutBack
                easing.overshoot: 4.0
            }
        }
    }
}
