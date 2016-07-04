import QtQuick 2.0
import org.nemomobile.configuration 1.0

ConfigurationGroup {
    id: ts_settings

    path: "/apps/harbour-ts_monitor"

    property string hostname
    property int port
    property int server_id
}
