// import "quickshell.js" as Theme
import "."
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import "config.js" as Config

// TODO: Implement a full working notification center
Scope {
    id: root

    NotificationServer {
        id: server

        actionsSupported: true
        bodySupported: true
        imageSupported: true
        onNotification: (n) => {
            console.log("got:", n.summary, "---", n.body);
            n.tracked = true;
        }
    }

    PanelWindow {
        id: notification

        property color bg: Colors.bg
        property color fg: Colors.fg
        property color text: Colors.text
        property color muted: Colors.muted
        property color red: Colors.red

        implicitWidth: 300
        implicitHeight: Math.max(1, column.implicitHeight)
        color: "transparent"
        exclusionMode: ExclusionMode.Ignore

        margins {
            top: 44
            right: 8
        }

        anchors {
            right: true
            top: true
        }

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
                    color: notification.bg
                    border.width: 1
                    border.color: modelData.urgency === NotificationUrgency.Critical ? notification.red : notification.fg
                }

            }

        }

    }

}
