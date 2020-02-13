import QtQuick 2.14
import QtQuick.Window 2.14

Item{
    id: root
    property color color
    property color pressedColor
    property color dimmedColor
    property bool isPressed: false
    property alias text: text.text
    property alias textFont: text.font
    property alias textColor: text.color
    //property alias padding: column.padding
    property alias borderRadius: background.radius


    signal clicked();

    signal pressed();

    signal released();

    signal pressAndHold();



    TapHandler {
        id: handler
        onTapped: root.clicked(mouseXY.x, mouseXY.y)
        onPressedChanged: mouseXY = handler.point.position
    }

    Rectangle{
        id: background
        color: root.enabled ? color : dimmedColor
        width: parent.width
        height: parent.height
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            width: parent.width
            onPressed: {background.color = pressedColor; root.pressed();}
            onReleased: {background.color = color; root.released();}
            height: parent.height
            onClicked: root.clicked();
            onPressAndHold: root.pressAndHold();
        }
        Text {
            id: text
            anchors.centerIn: parent
        }
    }
}
