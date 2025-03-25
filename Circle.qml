import QtQuick 2.15

Rectangle {
    id: myCircle
    width: 160
    height: 160

    property var bg
    property int animationDuration: 500
    property int clickState: 0

    // Mouse area that listens for clicks on the circle
    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Update background color based on click state
            let colors = myCircle.bg.getBackgroundColor(myCircle.clickState);
            myCircle.bg.stopColor1 = colors[0];
            myCircle.bg.stopColor2 = colors[1];

            // Update background colors based on click state
            let h1colors = hill.getGradientColors(myCircle.clickState, true);
            let h2colors = hill.getGradientColors(myCircle.clickState, false);

            hill.h1stopColor1 = h1colors[0];
            hill.h1stopColor2 = h1colors[1];
            hill.h2stopColor1 = h2colors[0];
            hill.h2stopColor2 = h2colors[1];

            // Start the appropriate animation
            if (myCircle.clickState === 0) anim1.start();
            else if (myCircle.clickState === 1) anim2.start();
            else anim3.start();

            // Cycle through click states
            myCircle.clickState = (myCircle.clickState + 1) % 3;
        }
    }

    // Loader for dynamic effects applied to the circle
    Loader {
        id: effectLoader
        anchors.centerIn: myCircle
        sourceComponent: initialStyleComponent
    }

    // Animation for moving and changing color
    SequentialAnimation {
        id: anim1
        ParallelAnimation {
            NumberAnimation { target: myCircle; property: "x"; to: 220; duration: myCircle.animationDuration }
            NumberAnimation { target: myCircle; property: "y"; to: 420; duration: myCircle.animationDuration }
            OpacityAnimator { target: effectLoader; from: 1; to: 0; duration: myCircle.animationDuration / 2 } // Fade out
            ColorAnimation { target: myCircle; property: "color"; to: "#feffdf"; duration: myCircle.animationDuration }
        }
        ScriptAction { script: effectLoader.sourceComponent = glowComponent; } // Change component
        ParallelAnimation {
            OpacityAnimator { target: effectLoader; from: 0; to: 1; duration: myCircle.animationDuration / 2 } // Fade in
        }
    }

    SequentialAnimation {
        id: anim2
        ParallelAnimation {
            NumberAnimation { target: myCircle; property: "x"; to: 220; duration: myCircle.animationDuration }
            NumberAnimation { target: myCircle; property: "y"; to: 160; duration: myCircle.animationDuration }
            OpacityAnimator { target: effectLoader; from: 1; to: 0; duration: myCircle.animationDuration / 2 } // Fade out
            ColorAnimation { target: myCircle; property: "color"; to: "#FDDD00"; duration: myCircle.animationDuration }
        }
        ScriptAction { script: effectLoader.sourceComponent = null; } // Change component
        ParallelAnimation {
            OpacityAnimator { target: effectLoader; from: 0; to: 1; duration: myCircle.animationDuration / 2 } // Fade in
        }
    }

    SequentialAnimation {
        id: anim3
        ParallelAnimation {
            NumberAnimation { target: myCircle; property: "x"; to: 45; duration: myCircle.animationDuration }
            NumberAnimation { target: myCircle; property: "y"; to: 300; duration: myCircle.animationDuration }
            OpacityAnimator { target: effectLoader; from: 1; to: 0; duration: myCircle.animationDuration / 2 } // Fade out
            ColorAnimation { target: myCircle; property: "color"; to: "#bcae76"; duration: myCircle.animationDuration }
        }
        ScriptAction { script: effectLoader.sourceComponent = initialStyleComponent; } // Change component
        ParallelAnimation {
            OpacityAnimator { target: effectLoader; from: 0; to: 1; duration: myCircle.animationDuration / 2 } // Fade in
        }
    }

    // Component defining the initial style of the circle
    Component {
        id: initialStyleComponent
        Item {
            Rectangle { width: 120; height: 120; radius: 100; color: "#3c3842"; anchors.centerIn: parent }
            Rectangle { width: 100; height: 100; radius: 100; color: "#4a4347"; anchors.centerIn: parent }
            Rectangle { width: 80; height: 80; radius: 100; color: "#564e4d"; anchors.centerIn: parent }
            Rectangle { width: 60; height: 60; radius: 100; color: "#bcae76"; anchors.centerIn: parent; anchors.bottomMargin: 2 }
            Rectangle { width: 52; height: 52; radius: 100; color: "#564e4d"; anchors.centerIn: parent; anchors.horizontalCenterOffset: 9; anchors.verticalCenterOffset: -8 }
        }
    }

    // Component defining a glowing effect when the circle is in frosty position
    Component {
        id: glowComponent
        Item {
            Rectangle { width: 80; height: 80; radius: 100; color: "#FFFACD"; opacity: 0.1; anchors.centerIn: parent }
            Rectangle { width: 100; height: 100; radius: 100; color: "#FFFACD"; opacity: 0.1; anchors.centerIn: parent }
            Rectangle { width: 120; height: 120; radius: 100; color: "#FFFACD"; opacity: 0.1; anchors.centerIn: parent }
        }
    }
}
