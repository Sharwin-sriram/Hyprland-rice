import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
    anchors {
        left: true
        right: true
        top: true
    }
    implicitHeight: 30
    Text {
        id: clock
        anchors.centerIn: parent
        // text: "Hello, World"
        Process {
            id: dateProc
            command: ["date"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: clock.text = text
            }
        }
        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: dateProc.running = true
        }
    }
}
