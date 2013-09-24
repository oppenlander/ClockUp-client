import QtQuick 2.0

Rectangle {
    id: action_bar_button_

    signal triggered

    property string imageSource: "../images/ab_menu.png"
    property string textSource: ""

    anchors {
        leftMargin: parent.height / 4
        rightMargin: parent.height / 4
        verticalCenter: parent.verticalCenter
    }
    height: parent.height * 2 / 3; width: parent.height * 2 / 3; color: "#00000000"
    Image {
        id: action_bar_button_image_
        anchors.fill: parent
        source: imageSource
    }

    Text {
        anchors {
            left: action_bar_button_image_.right
            leftMargin: ("" === textSource) ? 0 : parent.height / 4;
            verticalCenter: parent.verticalCenter
        }

        text: textSource
    }

    MouseArea {
        anchors.fill: parent
        onClicked: action_bar_button_.triggered()
    }
}
