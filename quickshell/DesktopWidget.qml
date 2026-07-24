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
    property string hours: ""
    property string min: ""
    property bool colonVisible: true
    property bool colon: true
    // Colors
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
        id: timeH

        command: ["sh", "-c", "date +'%I'"]
        Component.onCompleted: running = true

        stdout: SplitParser {
            onRead: (data) => {
                hours = data;
            }
        }

    }

    Process {
        id: timeM

        command: ["sh", "-c", "date +'%M %p'"]
        Component.onCompleted: running = true

        stdout: SplitParser {
            onRead: (data) => {
                min = data;
            }
        }

    }

    Process {
        id: colonProc

        stdout: SplitParser {
            onRead: (data) => {
                colon = colon === ":" ? " " : ":";
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
        interval: 60000
        running: true
        repeat: true
        onTriggered: {
            timeH.running = true;
            timeM.running = true;
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if (colon)
                clock.colonVisible = !clock.colonVisible;

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
            Layout.alignment: Qt.AlignHCenter

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
            Layout.alignment: Qt.AlignHCenter

            font {
                family: Config.fontWidget.familySub
                pixelSize: Config.fontWidget.size - 60
            }

        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            // anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5

            Text {
                id: hLabel

                text: "─ " + clock.hours.toUpperCase()
                color: "#FFF"

                font {
                    family: Config.fontWidget.familySub
                    pixelSize: Config.fontWidget.size - 75
                }

            }

            Text {
                id: colonLabel

                text: clock.colonVisible ? ":" : ""
                color: "#FFF"

                font {
                    family: Config.fontWidget.familySub
                    pixelSize: Config.fontWidget.size - 75
                }

            }

            Text {
                id: mLabel

                text: clock.min.toUpperCase() + " ─"
                color: "#FFF"

                font {
                    family: Config.fontWidget.familySub
                    pixelSize: Config.fontWidget.size - 75
                }

            }

        }

    }

}
