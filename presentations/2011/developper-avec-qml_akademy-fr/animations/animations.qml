import QtQuick 1.0

Rectangle {
    width: 400
    height: 300

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: 100
        height: 100
        radius: 20
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rotationAnim.start();
                colorAnim.start();
            }
        }
    }

    NumberAnimation {
        id: rotationAnim
        target: rect
        properties: "rotation"
        from: 0
        to: 360
        duration: 4000
        loops: Animation.Infinite
    }

    ColorAnimation {
        id: colorAnim
        target: rect
        properties: "color"
        from: "red"
        to: "blue"
        duration: 2000
        loops: Animation.Infinite
    }
}
