import QtQuick 2.0

ListModel {
    ListElement {
        name: "Home"
        icon_src: "../images/nav_home.png"
        page_src: "HomePage.qml"
    }
    ListElement {
        name: "Alarms"
        icon_src: "../images/nav_alarms.png"
        page_src: "AlarmsPage.qml"
    }
    ListElement {
        name: "History"
        icon_src: "../images/nav_history.png"
        page_src: "HistoryPage.qml"
    }
    ListElement {
        name: "Customize"
        icon_src: "../images/nav_customize.png"
        page_src: "CustomizePage.qml"
    }
    ListElement {
        name: "Store"
        icon_src: "../images/nav_store.png"
        page_src: "StorePage.qml"
    }
    ListElement {
        name: "Settings"
        icon_src: "../images/nav_settings.png"
        page_src: "SettingsPage.qml"
    }
}
