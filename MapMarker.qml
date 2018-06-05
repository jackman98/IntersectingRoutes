import QtQuick 2.10
import QtLocation 5.9

MapQuickItem {
    id: marker

    property alias nameMarker: root.text
    anchorPoint.x: root.width/2
    anchorPoint.y: root.height

    zoomLevel: map.zoomLevel


    sourceItem: Marker { id: root }
}
