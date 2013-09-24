import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    width: 500
    height: 800

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainView
    }

    MainView {
        id: mainView
    }

}
