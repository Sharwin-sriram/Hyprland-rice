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
        onNotification: n => n.tracked = true
    }

    // PanelWindow {
    //     id: notification

    //     width: 300
    //     height: 100

    //     anchors {
    //         right: true
    //         top: true
    //     }
    // }
}
