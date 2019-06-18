import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    anchors.fill: parent

    Column {
        anchors.centerIn: parent

        Image {
            id: icon
            source: "image://theme/harbour-ts_monitor"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: mainWindow.userCount
        }
    }
    CoverActionList {
        id: coverRefresh

        CoverAction {
            iconSource: "image://theme/icon-cover-refresh"
            onTriggered: {
                refreshData();
            }
        }
    }
}
