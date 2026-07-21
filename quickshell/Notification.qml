import Quickshell.Services.Notifications
import Quickshell.Wayland
import QtQuick.Layouts
import Quickshell
import QtQuick
import "config.js" as Config
import "quickshell.js" as Theme

// TODO: Implement a full working notification center
Scope {
    id: root

    NotificationServer {
        id: server

        actionsSupported: true
        bodySupported: true
        imageSupported: true
        onNotification: n => {
            console.log("got:", n.summary, "---", n.body)
            n.tracked = true;
        }
    }

    PanelWindow {
        id: notification
        margins {
            top: 44
            right: 8
        }

        anchors {
            right: true
            top: true
        }

        implicitWidth: 300
        implicitHeight: Math.max(1, column.implicitHeight)
        color: "transparent"

        exclusionMode: ExclusionMode.Ignore

        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Repeater {
                model: server.trackedNotifications
                delegate: Rectangle {
                    id: card
                    required property var modelData

                    Layout.fillWidth: true
                    // Layout.preferredHeight: 60
                    Layout.preferredHeight: layout.implicitHeight + 20
                    radius: 8
                    color: Theme.colors.bg
                    border.width: 1
                    border.color: modelData.urgency === NotificationUrgency.Critical ? Theme.colors.red : Theme.colors.fg
                }
            }
        }
    }
}
