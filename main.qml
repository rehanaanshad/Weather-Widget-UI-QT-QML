import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 350
    height: 600
    title: qsTr("Weather Widget")

    property int weatherIndex: 0
    property var weatherConditions: [
        {
            "bgColor1": "#0F2129",
            "bgColor2": "#47334A",
            "groundColor1": "#2f2b3c",
            "groundColor2": "#091B21",
            "degreeColor": "#4F787D",
            "degreeValue": "+24",
            "placeColor": "#694c6d",
            "placeValue": "MADRID",
            "weatherText": "Clear",
            "sunColor": "#BCAE76"
        },
        {
            "bgColor1": "#29386f",
            "bgColor2": "#b8f5ff",
            "groundColor1": "#f3ffff",
            "groundColor2": "#9af2ff",
            "degreeColor": "#a8ddff",
            "degreeValue": "-13",
            "placeColor": "#4497bf",
            "placeValue": "MOSCOW",
            "weatherText": "Frosty",
            "sunColor": "#feffdf"
        },
        {
            "bgColor1": "#ffbd3f",
            "bgColor2": "#fff097",
            "groundColor1": "#e0d7a4",
            "groundColor2": "#e7c77a",
            "degreeColor": "#fff5b8",
            "degreeValue": "+32",
            "placeColor": "#f7a526",
            "placeValue": "ANKARA",
            "weatherText": "Hot",
            "sunColor": "#ffdb50"
        }
    ]

    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        radius: 10
        gradient: Gradient {
            GradientStop { position: 0.0; color: weatherConditions[weatherIndex].bgColor1 }
            GradientStop { position: 1.0; color: weatherConditions[weatherIndex].bgColor2 }
        }

        Column {
            id: textContainer
            width: parent.width
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: degrees
                y:10
                x:70
                font.pixelSize: 100
                color: weatherConditions[weatherIndex].degreeColor
                text: weatherConditions[weatherIndex].degreeValue + "\u00B0"
                font.bold: true
            }
            Text {
                id: place
                y:120
                x:120
                font.pixelSize: 20
                color: weatherConditions[weatherIndex].placeColor
                text: weatherConditions[weatherIndex].placeValue
                font.bold: true

            }
            Text {
                id: weather
                y:500
                x:130
                font.pixelSize: 20
                color: "#FFFFFF"
                text: weatherConditions[weatherIndex].weatherText
            }
        }

        Rectangle {
            id: sun
            width: 60
            height: 60
            radius: 30
            color: weatherConditions[weatherIndex].sunColor
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            anchors.left: parent.left
            anchors.leftMargin: 100
            z: 2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    weatherIndex = (weatherIndex + 1) % weatherConditions.length
                }
            }
        }

        Rectangle {
            width: 270
            height: 150
            radius: 75
            gradient: Gradient {
                GradientStop { position: 0.0; color: weatherConditions[weatherIndex].groundColor1 }
                GradientStop { position: 1.0; color: weatherConditions[weatherIndex].groundColor2 }
            }
            rotation: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -50
            anchors.left: parent.left
            anchors.leftMargin: -20
            z: 1
        }

        Rectangle {
            width: 500
            height: 150
            radius: 75
            gradient: Gradient {
                GradientStop { position: 0.0; color: weatherConditions[weatherIndex].groundColor1 }
                GradientStop { position: 1.0; color: weatherConditions[weatherIndex].groundColor2 }
            }
            rotation: -10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -70
            anchors.right: parent.right
            anchors.rightMargin: -80
            z: 1
        }

        Text {
            id: dateTimeText
            color: "#FFFFFF"  // Bright white for visibility
            font.pixelSize: 30
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
            z: 3  // Ensure it's on top of other elements
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                var date = new Date();
                dateTimeText.text = Qt.formatDateTime(date, "dddd, hh:mm:ss");
            }
        }
    }
}
