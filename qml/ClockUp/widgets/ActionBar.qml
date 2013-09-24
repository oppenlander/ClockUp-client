import QtQuick 2.0

Rectangle {
    id: action_bar_
    anchors.top: parent.top
    width: parent.width; height: list_item_height; color: "#555555"

    ActionBarButton {
        id: action_bar_menu_
        anchors.left: action_bar_.left
        imageSource: "../images/ab_menu.png"
        onTriggered: mv_.onMenu()
    }
}
