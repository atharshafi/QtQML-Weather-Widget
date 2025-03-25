import QtQuick 2.15

Window {
    id: root
    width: 350
    height: 650
    title: qsTr("Weather Widget")
    visible: true

    property int animationDuration: 500

    // Background rectangle that clips content and manages gradient color
    Rectangle {
        id: bg
        clip: true
        width: 350
        height: 650

        // Properties to hold the current background gradient colors
        property color stopColor1: "#0F2129" // Initial default color
        property color stopColor2: "#47334A" // Initial default color

        // Determines the background gradient colors based on click state
        function getBackgroundColor(clickState) {
            if (clickState === 0) return ["#29386f", "#b8f5ff"];
            else if (clickState === 1) return ["#ffc044", "#ffe584"];
            else return ["#0F2129", "#47334A"];
            return [stopColor1, stopColor2]; // Default to current colors
        }

        // Gradient background with smooth transition
        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: bg.stopColor1 }
                GradientStop { position: 1.0; color: bg.stopColor2 }
            }
        }

        // Apply smooth transition when colors change
        Behavior on stopColor1 {
            ColorAnimation { duration: root.animationDuration }
        }
        Behavior on stopColor2 {
            ColorAnimation { duration: root.animationDuration }
        }

        // Weather Info
        WeatherInfo {
            id: weatherInfo
            anchors.horizontalCenter: parent.horizontalCenter
            circleY: myCircle.y // Pass the y property of myCircle
        }

        // Circle
        Circle {
            id: myCircle
            x: 45
            y: 300
            width: 60
            height: 60
            radius: 50
            bg: bg // Pass the bg object to Circle.qml
        }

        // Hills
        Hills {
            id: hill
            width: 350
            height: 650
        }

        // Day and time text display, updates every second
        Text {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            font.pixelSize: 16
            color: "#939386"
            anchors.bottomMargin: 5
            anchors.rightMargin: 10
            text: Qt.formatDateTime(new Date(), "dddd | MM-dd-yyyy | hh:mm:ss AP")
            Timer { interval: 1000; running: true; repeat: true; onTriggered: parent.text = Qt.formatDateTime(new Date(), "dddd | dd-MM-yyyy | hh:mm:ss AP") }
        }
    }
}
