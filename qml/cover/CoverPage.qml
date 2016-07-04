import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("In Teamspeak:\n") + ts3.userCount(settings.hostname, settings.port, settings.server_id) + " " + qsTr("users")
    }

/*    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-refresh"
        }
    } */
}
