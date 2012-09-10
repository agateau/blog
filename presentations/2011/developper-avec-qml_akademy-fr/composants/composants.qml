import QtQuick 1.0

/// main
Rectangle {
    width: 200
    height: 150
    Square {
        x: 10
        y: 10
    }
    Square {
        x: 60
        y: 10
    }
    Square {
        x: 10
        y: 60
        color: "red"
    }
}
