import QtQuick 2.0

Component {
    id: navigationDelegate
    Item {
        width: parent.width; height: list_item_height
        Image {
            id: icon_image_
            anchors { left: parent.left; leftMargin: parent.width * 0.05; verticalCenter: parent.verticalCenter }
            width: parent.width * 0.1; height: parent.width * 0.1
            source: icon_src
        }
        Text {
            anchors { left: icon_image_.right; leftMargin: parent.width * 0.05; verticalCenter: parent.verticalCenter }
            color: "white"; font.pixelSize: parent.width * 0.08; text: qsTr(name)
        }
        Rectangle {
            anchors { right: parent.right; bottom: parent.bottom }
            width: parent.width * 0.8; height: 1; color: "gray"
        }
        MouseArea {
            anchors.fill: parent
            enabled: mv_.menu_shown
            onClicked: onMenuLoadPage(page_src)
        }
    }
}
