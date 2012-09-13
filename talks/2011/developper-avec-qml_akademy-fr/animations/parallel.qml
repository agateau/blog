
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
            onClicked: anim.start()
        }
    }

    ParallelAnimation {
        id: anim

        NumberAnimation {
            target: rect
            properties: "rotation"
            from: 0
            to: 360
            duration: 4000
            loops: Animation.Infinite
        }

        SequentialAnimation {
            ColorAnimation {
                target: rect
                properties: "color"
                to: "blue"
                duration: 2000
            }
            ColorAnimation {
                target: rect
                properties: "color"
                to: "green"
                duration: 2000
            }
            ColorAnimation {
                target: rect
                properties: "color"
                to: "red"
                duration: 2000
            }
            loops: Animation.Infinite
        }

        SequentialAnimation {
            NumberAnimation {
                target: rect
                properties: "scale"
                to: 4
                duration: 1000
            }
            NumberAnimation {
                target: rect
                properties: "scale"
                to: 1
                duration: 1000
            }
            loops: Animation.Infinite
        }
    }
}
