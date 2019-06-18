import QtQuick 2.0
import Sailfish.Silica 1.0

import "cover"
import "pages"
import "common"

ApplicationWindow
{
    id: mainWindow

    initialPage: Component { UserList { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All

    ListModel { id: userList }

    property string userCount;

    Settings {
        id: settings
    }

    function refreshData() {
        var listOfUsers = ts3.fetchUsers(settings.hostname, settings.port, settings.server_id);
        userList.clear();
        for(var i = 0; i < listOfUsers.length; i++) {
            var item = {userData: ""}
            item.userData = listOfUsers[i];
            userList.append(item);
        }
        userCount = qsTr("In TeamSpeak:") + "\n" + qsTr("%1 users").arg(userList.rowCount());
    }
}
