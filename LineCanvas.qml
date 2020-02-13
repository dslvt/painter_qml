import QtQuick 2.14
import QtQuick.Window 2.14

Item {
    property var lines: []
    property var newLine: []
    property string lineColor: 'red'
    property int lineWidth: 2
    function paintLines(ctx, lines) {
        for (var iLine = 0; iLine < lines.length; ++iLine) {
            var line = lines[iLine];
            if (line['width'] !== undefined)
                ctx.lineWidth = line['width'];
            if (line.fill !== undefined) {
                ctx.fillStyle = line.fill;
                ctx.fill();
            }
            if (line['color'] !== undefined) {
                ctx.strokeStyle = line['color'];
                ctx.stroke();
            }
            if (line['points'] !== undefined){
                var points = line['points'];
                ctx.beginPath();
                ctx.moveTo(points[0]['x'], points[0]['y']);
                for(var i = 1; i < points.length; i ++){
                    ctx.lineTo(points[i]['x'], points[i]['y'])
                    ctx.stroke();
                }
            }

        }
    }

    function addLine(color,width,points){
        lines.push({'color': color, 'width':width, 'points': points});
        mainCanvas.requestPaint();
    }

    function removeColor(color){
        lines = lines.filter(function(line){
            return line['color'] !== color;
        });
        mainCanvas.requestPaint();
    }
    Canvas {
        id: mainCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = mainCanvas.getContext('2d');
            ctx.clearRect(0,0,width, height);
            paintLines(ctx, lines);
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = canvas.getContext("2d");
            ctx.clearRect(0, 0, width, height);
            paintLines(ctx, newLine);
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: newLine.push({
            'color': lineColor,
            'width': lineWidth,
            'points': [{'x': mouseX, 'y': mouseY}]
        })
        onPositionChanged: {
            newLine[0]['points'].push({'x':mouseX, 'y':mouseY});
            canvas.requestPaint();
        }

        onReleased: {
            addLine(lineColor, newLine[0]['width'], newLine[0]['points']);
            addLine(lineColor, 0, [{'x':0,'y':0}]);
            newLine = [];
        }
    }
}
