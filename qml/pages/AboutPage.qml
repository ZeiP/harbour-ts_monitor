import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: aboutpage
    SilicaFlickable {
        anchors.fill: parent

        Column {
            id: mainCol
            spacing: Theme.paddingMedium
            anchors.left: parent.left; anchors.leftMargin: Theme.paddingMedium
            anchors.right: parent.right; anchors.rightMargin: Theme.paddingMedium
            PageHeader {
                title: qsTr("About")
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../images/icon.png"
            }
            Column {
                anchors.left: parent.left; anchors.right: parent.right
                spacing: Theme.paddingSmall
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: Theme.fontSizeHuge
                    text: qsTr("TS3 monitor")
                }
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: Theme.fontSizeExtraSmall
                    color: Theme.secondaryColor
                    wrapMode: Text.WordWrap
                    text: qsTr("Version %1").arg("1.1")
                }
            }
            Label {
                wrapMode: Text.WordWrap
                anchors.left: parent.left; anchors.right: parent.right
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr("Simple application for listing active users on a TeamSpeak server.")
            }
            Label {
                anchors.left: parent.left; anchors.right: parent.right
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.secondaryColor
                wrapMode: Text.WordWrap
                text: qsTr("Thanking:") +
"\n" + qsTr("– Jyri-Petteri ”ZeiP” Paloposki (author)") + "\n"
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Server installation instructions")
                onClicked: Qt.openUrlExternally("https://github.com/ZeiP/harbour-ts_monitor/blob/master/doc/server.md")
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("GitHub (source codes and issues)")
                onClicked: Qt.openUrlExternally("https://github.com/ZeiP/harbour-ts_monitor")
            }
        }

        VerticalScrollDecorator {}
    }
}
