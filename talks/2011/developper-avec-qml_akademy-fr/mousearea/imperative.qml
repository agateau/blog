import QtQuick 1.0

Rectangle {
    width: 400
    height: 300

    Rectangle {
        width: 40
        height: 40
        anchors.centerIn: parent
        color: "red"

        MouseArea {
            anchors.fill: parent
            onPressed: {
                parent.color = "green";
            }
            onReleased: {
                parent.color = "red";
            }
        }
    }
}
