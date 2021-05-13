import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaListView {
        id: listview
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About and help")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }
            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    refreshData();
                }
            }
        }

        width: parent.width;
        height: parent.height

        model: userList

        header: PageHeader {
            title: qsTr("Now in TeamSpeak")
        }

        delegate: Item {
            id: delegate
            width: parent.width
            height: Theme.itemSizeMedium

            Label {
                text: userData
                font.pixelSize: Theme.fontSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
        }
        Component.onCompleted: {
            refreshData();
        }
    }
}


