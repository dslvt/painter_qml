import QtQuick 2.0

Item {
    id: root
    property bool checked: false
    property alias color: runner.color
    property color backgroundColor
    property color dimmedColor
    property alias borderRadius: background.radius

    function trigger(){
        checked = !checked
    }

    Rectangle {
        id: background
        anchors.fill: root
        color: root.enabled ? root.backgroundColor : root.dimmedColor
    }

    Rectangle {
        id: runner
        radius: parent.borderRadius
        width: root.width / 2
        height: parent.height

        Behavior on x { SpringAnimation { spring: 2; damping: 0.2 } }
    }

    state: checked ? "on" : "off"
    states: [
        State {
            name: "off"
            PropertyChanges {
                target: runner
                x: 0
            }
        },
        State {
            name: "on"
            PropertyChanges {
                target: runner
                x: parent.width / 2
            }
        }
    ]
}
