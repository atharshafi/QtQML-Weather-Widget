import QtQuick 2.15

Item {
    id: hill
    width: 350
    height: 650

    // Declare gradient stop colors
    property color h1stopColor1: "#0F2129"
    property color h1stopColor2: "#282837"
    property color h2stopColor1: "#282837"
    property color h2stopColor2: "#0F2129"

    // Gradient color function for the hills based on circle's click state
    function getGradientColors(clickState, isHill1) {
        switch (clickState) {
            case 0: return isHill1 ? ["#edfeff", "#bbf7ff"] : ["#bbf7ff", "#edfeff"];
            case 1: return isHill1 ? ["#e0d59e", "#d6bf77"] : ["#d6bf77", "#e0d59e"];
            default: return isHill1 ? ["#0F2129", "#282837"] : ["#282837", "#0F2129"];
            //default: return isHill1 ? [h1stopColor1, h1stopColor2] : [h2stopColor1, h2stopColor2];
        }
    }

    // First hill
    Rectangle {
        id: hill1
        width: 250
        height: 200
        radius: 80
        gradient: Gradient {
            stops: [
                GradientStop { position: 1.0; color: hill.h1stopColor1 },
                GradientStop { position: 0.0; color: hill.h1stopColor2 }
            ]
        }
        rotation: -160
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 295
        anchors.horizontalCenterOffset: -70
    }

    // Second hill
    Rectangle {
        id: hill2
        width: 190
        height: 500
        radius: 600
        gradient: Gradient {
            stops: [
                GradientStop { position: 1.0; color: hill.h2stopColor1 },
                GradientStop { position: 0.0; color: hill.h2stopColor2 }
            ]
        }
        rotation: 80
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 310
    }

    // Behavior for gradient colors
    Behavior on h1stopColor1 { ColorAnimation { duration: hill.animationDuration } }
    Behavior on h1stopColor2 { ColorAnimation { duration: hill.animationDuration } }
    Behavior on h2stopColor1 { ColorAnimation { duration: hill.animationDuration } }
    Behavior on h2stopColor2 { ColorAnimation { duration: hill.animationDuration } }
}
