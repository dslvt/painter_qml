import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    height: 720; width: 720;
    property string lineColor: canvas.lineColor;
    property int lineSize;
    LineCanvas{
        id: canvas
        width: parent.width
        height: parent.height
    }

    RowLayout{
        id: switches
        anchors.bottom:  parent.bottom
        width: parent.width
        anchors.margins: 20

        Switch{
            id: redSwitch
            width: parent.width / 10
            height: parent.width / 20
            color: "red"
            backgroundColor: "gray"
            dimmedColor: "gray"
            borderRadius: height / 2
            checked: canvas.lineColor == 'red' ? true:false

            MouseArea{
                anchors.fill: parent
                onClicked: canvas.lineColor = 'red'
            }
        }
        Switch{
            id: greenSwitch
            width: parent.width / 10
            height: parent.width / 20
            color: "green"
            backgroundColor: "gray"
            dimmedColor: "gray"
            borderRadius: height / 2
            checked: canvas.lineColor == 'green' ? true:false
            MouseArea{
                anchors.fill: parent
                onClicked: canvas.lineColor = 'green'
            }
        }
        Switch{
            id: blueSwitch
            width: parent.width / 10
            height: parent.width / 20
            color: "blue"
            backgroundColor: "gray"
            dimmedColor: "gray"
            borderRadius: height / 2
            checked: canvas.lineColor == 'blue' ? true:false
            MouseArea{
                anchors.fill: parent
                onClicked: canvas.lineColor = 'blue'
            }

        }
        Switch{
            id: yellowSwitch
            width: parent.width / 10
            height: parent.width / 20
            color: "yellow"
            backgroundColor: "gray"
            dimmedColor: "gray"
            borderRadius: height / 2
            checked: canvas.lineColor == 'yellow' ? true:false
            MouseArea{
                anchors.fill: parent
                onClicked: canvas.lineColor = 'yellow'
            }

        }
        Switch{
            id: blackSwitch
            width: parent.width / 10
            height: parent.width / 20
            color: "black"
            backgroundColor: "gray"
            dimmedColor: "gray"
            borderRadius: height / 2
            checked: canvas.lineColor == 'black' ? true:false
            MouseArea{
                anchors.fill: parent
                onClicked: canvas.lineColor = 'black'
            }

        }
    }

    ColumnLayout{
        id: buttons
        height: parent.height * 0.7
        width: parent.width / 5
        anchors.right: parent.right
        Button{
            id: plusButton
            text: '+'
            textFont: {}
            textColor: 'red'
            color: 'blue'
            pressedColor: 'gray'
            dimmedColor: 'gray'
               //padding: 10
            borderRadius: 20
            width: parent.width /2
            height: width/2
            onClicked: {
                canvas.lineWidth += 1
            }
        }
        Button{
            id: minusButton
            text: '-'
            textFont: {}
            textColor: 'red'
            color: 'blue'
            pressedColor: 'gray'
            dimmedColor: 'gray'
               //padding: 10
            borderRadius: 20
            width: parent.width /2
            height: width/2
            onClicked: {
                if (canvas.lineWidth !== 1){
                    canvas.lineWidth -= 1
                }
            }
        }

         Button{
            id: deleteButton
            text: 'X'
            textFont: {}
            textColor: 'red'
            color: 'blue'
            pressedColor: 'gray'
            dimmedColor: 'gray'
               //padding: 10
            borderRadius: 20
            width: parent.width /2
            height: width/2
            onClicked: {
                canvas.removeColor(canvas.lineColor);
            }
        }


    }
}

