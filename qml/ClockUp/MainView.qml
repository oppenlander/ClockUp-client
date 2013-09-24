import QtQuick 2.0
import QtQuick.Controls 1.0

import "models"
import "widgets"

Rectangle {
    id: mv_

    anchors.fill: parent
    color: "black"

    property bool menu_shown: false
    property bool ui_unlocked: true
    property string current_page: "HomePage.qml"

    property int list_item_height: 72

    Rectangle {
        id: menu_view_

        anchors.fill: parent
        color: "#303030"
        opacity: mv_.menu_shown ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 300 } }

        Rectangle {
            anchors.fill: parent
            color: "#303030"

            // Header that takes you back to home

            ListView {
                anchors.fill: parent
                model: NavigationModel {}
                delegate: NavigationDelegate {}
                header: Rectangle {
                    anchors.right: parent.right
                    width: parent.width * 0.8; height: 1; color: "gray"
                }
            }
        }
    }

    Rectangle {
        id: screen_view_

        anchors.fill: parent
        color: "white"

        /* This moves the screen aside */
        transform: Translate {
            id: screen_translate_
            x: 0
            property bool running: false
            Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
        }

        /* This is the menu shadow */
        BorderImage {
            id: menu_shadow_
            anchors { top: parent.top; bottom: parent.bottom; left: parent.left; margins: -10 }
            z: -1 /* Place this below screen_view_ */
            visible: mv_.menu_shown
            source: "images/shadow.png"
            border { left: 12; top: 12; right: 12; bottom: 12 }
        }

        Loader {
            id: screenLoader
            anchors.fill: parent
            source: "HomePage.qml"
        }

        MouseArea {
            anchors.fill: parent
            enabled: mv_.menu_shown
            onClicked: mv_.onMenu()
        }
    }

    /* Open/Close the Menu */
    function onMenu() {
        screen_translate_.x = mv_.menu_shown ? 0 : mv_.width * 0.9;
        mv_.menu_shown = !mv_.menu_shown;
    }

    /* Load a new Page, closing the menu when the animations/loading is complete */
    function onMenuLoadPage(page_src) {
        if(current_page === page_src) {
            /* Nothing to do, close the menu */
            mv_.onMenu();
            return;
        }
        screen_translate_.x = screen_view_.width;
        current_page = page_src;
        onMenuLoadPageAnimateTimer.start();
    }
    Timer {
        id: onMenuLoadPageAnimateTimer
        property bool first: true
        interval: 400; running: false; repeat: false
        onTriggered: {
            screenLoader.setSource(current_page);
            onMenuLoadPageLoadTimer.start();
        }
    }
    Timer {
        id: onMenuLoadPageLoadTimer
        interval: 100; running: false; repeat: true
        onTriggered: {
            if(screenLoader.status == Loader.Ready) {
                onMenu();
                stop();
            }
        }
    }
}
