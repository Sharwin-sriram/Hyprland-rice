import "."
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
// import "quickshell.js" as Colors
import "config.js" as Config

PanelWindow {
    id: clock

    property string day: ""
    property string date: ""
    property string time: ""

    property color fg: Colors.fg
    property color bg: Colors.bg
    property color text: Colors.text
    property color muted: Colors.muted

    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Background

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Process {
        id: dayProc

        command: ["sh", "-c", "date +%A"]
        Component.onCompleted: running = true

        stdout: SplitParser {
            onRead: (data) => {
                console.log(data);
                day = data;
            }
        }

    }

    Process {
        id: dateProc

        command: ["sh", "-c", "date +'%d %B %Y'"]
        Component.onCompleted: running = true

        stdout: SplitParser {
            onRead: (data) => {
                console.log(data);
                date = data;
            }
        }

    }

    Process {
        id: timeProc

        command: ["sh","-c","date +'%I:%M %p'"]
        Component.onCompleted: running = true

        stdout: SplitParser {
            onRead: (data) => {
                time = data;
            }
        }
    }

    Timer {
        interval: 8.64e+07
        running: true
        repeat: true
        onTriggered: {
            dayProc.running = true;
            dateProc.running = true;
        }
    }

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: {
            timeProc.running = true;
        }
    }

    ColumnLayout {
        // x: 100
        // x: (1060 - width) / 2
        // y: 1250 - height
        x: (1920 - width) / 2
        y: 140

        Text {
            // anchors.centerIn: parent

            id: dayLabel

            text: clock.day.toUpperCase()
            // text: ""
            color: clock.fg
            anchors.horizontalCenter: parent.horizontalCenter

            font {
                family: Config.fontWidget.familyHeading
                pixelSize: Config.fontWidget.size + 10
                letterSpacing: 30
            }

        }

        Text {
            id: dateLabel

            text: clock.date.toUpperCase()
            // color: clock.muted
            color: "#FFFFFF"
            anchors.horizontalCenter: parent.horizontalCenter

            font {
                family: Config.fontWidget.familySub
                pixelSize: Config.fontWidget.size - 60
            }

        }

        Text {
            id: timeLabel

            text: "─ " + clock.time.toUpperCase() + " ─"
            color: "#FFF"
            anchors.horizontalCenter: parent.horizontalCenter

            font {
                family: Config.fontWidget.familySub
                pixelSize: Config.fontWidget.size - 75
            }
        }

    }

}
