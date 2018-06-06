import QtQuick 2.10

Image {
    id: image
    property alias text: number.text
    property MapMarker owner
    source: "qrc:/images/mapMarker.png"
    sourceSize.width: 48
    sourceSize.height: 48
    opacity: dragArea1.pressed ? 0.6 : 1.0

    Drag.active: dragArea1.drag.active
    Drag.hotSpot.x: 10
    Drag.hotSpot.y: 10

    MouseArea {
        id: dragArea1
        anchors.fill: parent
        hoverEnabled : false
        preventStealing: true
        drag.target: parent
        property int previousX
        property int previousY
        onPressed: {
            console.log(image.x, image.y)
            previousX = image.x
            previousY = image.y
        }

        onReleased: {
            if (dropArea.containsDrag === true) {
                owner.coordinate = map.toCoordinate(Qt.point(image.x + image.width / 2, image.y + image.height))
                image.visible = false
            }
            else {
                image.x = previousX
                image.y = previousY
            }
        }

    }

    Text {
        id: number
        text: qsTr("")
    }
}
