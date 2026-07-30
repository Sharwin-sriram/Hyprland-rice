// import "."
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Wayland

// TODO: Implement a full logout menu
PanelWindow {
    id: logoutMenu

    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    implicitHeight: 80

    anchors {
        // top: true
        left: true
        right: true
        bottom: true
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 0

        Rectangle {
            height: 80
            // Layout.fillWidth: true
            width: 500
            color: "white"
            radius: 6
        }

    }

}
