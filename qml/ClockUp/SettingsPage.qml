import QtQuick 2.0

import "widgets"

Rectangle {
    anchors.fill: parent

    ActionBar {
        Text {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            color: "white"; font.pixelSize: parent.height * 2 / 3; text: qsTr("Settings")
        }
    }
}
