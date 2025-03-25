import QtQuick 2.15

Item {
    id: weatherInfo

    property int circleY: 0

    // Data model for weather information
    property var weatherData: {
        160: { temperature: "+32°", location: "ANKARA", condition: "Hot", tempColor: "#fff5b8", locColor: "#F7A629", condColor: "#FF5733" },
        300: { temperature: "+24°", location: "MADRID", condition: "Clear", tempColor: "#4f787d", locColor: "#61485F", condColor: "white" },
        420: { temperature: "-13°", location: "MOSCOW", condition: "Frosty", tempColor: "#A8DEFF", locColor: "#4896B5", condColor: "#D8E9F0" }
    }

    // Function to get weather data based on circleY
    function getWeatherData(property) {
        return weatherData[circleY] ? weatherData[circleY][property] : ""
    }

    // Temperature text display
    Text {
        id: temperatureText
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 100
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 50
        opacity: text ? 1 : 0
        text: weatherInfo.getWeatherData("temperature")
        color: weatherInfo.getWeatherData("tempColor")
        Behavior on opacity { PropertyAnimation { duration: 500 } }
    }

    // Location text display
    Text {
        id: locationText
        font.pixelSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 180
        opacity: text ? 1 : 0
        text: weatherInfo.getWeatherData("location")
        color: weatherInfo.getWeatherData("locColor")
        Behavior on opacity { PropertyAnimation { duration: 500 } }
    }

    // Weather condition text display
    Text {
        id: weatherConditionText
        font.pixelSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 205
        opacity: text ? 1 : 0
        text: weatherInfo.getWeatherData("condition")
        color: weatherInfo.getWeatherData("condColor")
        Behavior on opacity { PropertyAnimation { duration: 500 } }
    }
}
