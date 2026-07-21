import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import QtQuick
import "quickshell.js" as Config

// TODO: Add more functionality to the bar and make the bar look better
PanelWindow {
    id: root
    margins {
        top: 4
        right: 5
        left: 5
    }

    property color colBg: Config.colors.bg
    property color colFg: Config.colors.text
    property color colText: Config.colors.fg
    property color colBlue: Config.colors.muted
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 18

    property int currentWorkspace: Hyprland.focusedWorkspace?.id
    property int totalWorkspaces: 5
    property int focusedWorkspaces: currentWorkspace > totalWorkspaces ? currentWorkspace - totalWorkspaces : totalWorkspaces

    // System Properties

    property int cpuUsage: 0
    property int lastCpuIdle: 0
    property int lastCpuTotal: 0

    property int memUsage: 0

    property int temp: 0

    anchors.top: true
    anchors.left: true
    anchors.right: true

    color: "transparent"
    implicitHeight: 35

    Rectangle {
        anchors.fill: parent
        color: root.colBg
        border.color: root.colBorder
        // border.width: 2
        radius: 8
    }

    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]

        stdout: SplitParser {
            onRead: data => {
                var p = data.trim().split(/\s+/);
                var idle = parseInt(p[4]) + parseInt(p[5]);
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0);
                cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)));
                lastCpuTotal = total;
                lastCpuIdle = idle;
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: tempProc
        command: ["sh", "-c", "sensors k10temp-pci-00c3 | grep Tctl"]

        stdout: SplitParser {
            onRead: data => {
                var p = data.trim().split(/\s+/);
                var currTemp = parseFloat(p[1]);
                temp = currTemp;
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                var parts = data.trim().split(/\s+/);
                var total = parseInt(parts[1]) || 1;
                var used = parseInt(parts[2]) || 0;
                memUsage = Math.round(100 * used / total);
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true;
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8

        Text {
            text: temp + "°C"
            color: root.colText
            font {
                family: root.fontFamily
                pixelSize: root.fontSize
                bold: true
            }
            Timer {
                interval: 4000
                running: true
                repeat: true
                onTriggered: {
                    tempProc.running = true;
                }
            }
        }
        

        Text {
            text: "CPU: " + cpuUsage + "%"
            color: root.colText
            font {
                family: root.fontFamily
                pixelSize: root.fontSize
                bold: true
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Repeater {
            model: root.focusedWorkspaces
            Text {
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                text: index + 1
                color: isActive ? colText : (ws ? colBlue : colFg)
                font {
                    pixelSize: root.fontSize
                    bold: true
                }

                Connections {
                    target: Hyprland
                    function onFocusedWorkspaceChanged() {
                        root.totalWorkspaces = Hyprland.focusedWorkspace?.id > 5 ? Hyprland.focusedWorkspace?.id : 5;
                    }
                }

                // color: "#D9E8C1"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + " })");
                    }
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }

        // Rectangle {
        //     width: 2
        //     height: 16
        //     color: root.colBlue
        // }

        Text {
            text: "Mem: " + memUsage + "%"
            color: root.colText
            font {
                family: root.fontFamily
                pixelSize: root.fontSize
                bold: true
            }
            Timer {
                interval: 20000
                running: true
                repeat: true
                onTriggered: {
                    memProc.running = true;
                }
            }
        }
    }
}
