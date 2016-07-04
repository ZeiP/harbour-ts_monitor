import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "common"

ApplicationWindow
{
    initialPage: Component { UserList { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All

    Settings {
        id: settings
    }
}
