import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: settingspage

    SilicaFlickable {
        anchors.fill: parent
        Column {
            anchors.fill: parent
            DialogHeader {
                acceptText: qsTr("Save")
            }
            TextField {
                id: hostnameField
                width: parent.width
                label: qsTr("TeamSpeak 3 server hostname")
                placeholderText: qsTr("TeamSpeak 3 server hostname")
                text: settings.hostname
                focus: true
                inputMethodHints: Qt.ImhUrlCharactersOnly

                EnterKey.enabled: text.length > 0
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: port.focus = true
            }
            TextField {
                id: portField
                width: parent.width
                label: qsTr("TeamSpeak 3 server port (default %1)").arg("10011")
                placeholderText: qsTr("TeamSpeak 3 server port (default %1)").arg("10011")
                text: settings.port > 0 ? settings.port : ""
                inputMethodHints: Qt.ImhDigitsOnly

                EnterKey.enabled: text.length > 0
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: server_id.focus = true
            }
            TextField {
                id: serverIdField
                width: parent.width
                label: qsTr("TeamSpeak 3 server ID (default %1)").arg("0")
                placeholderText: qsTr("TeamSpeak 3 server ID (default %1)").arg("0")
                text: settings.server_id
                inputMethodHints: Qt.ImhDigitsOnly

                EnterKey.enabled: text.length > 0
                EnterKey.iconSource: "image://theme/icon-m-enter-close"
                EnterKey.onClicked: focus = false
            }
        }
        VerticalScrollDecorator {}
    }
    onDone: {
        if (result == DialogResult.Accepted) {
            settings.hostname = hostnameField.text
            settings.port = portField.text
            settings.server_id = serverIdField.text
        }
    }
}
