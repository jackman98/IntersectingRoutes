import QtQuick 2.10
import QtLocation 5.9

MapQuickItem {
    id: marker

    property alias nameMarker: image.text
    property bool isFirstRoute
    anchorPoint.x: image.width/2
    anchorPoint.y: image.height

    zoomLevel: map.zoomLevel


    sourceItem: Image {
        id: image
        property alias text: number.text
        source: "qrc:/images/mapMarker.png"
        sourceSize.width: 48
        sourceSize.height: 48
        opacity: markerMouseArea.pressed ? 0.6 : 1.0
        MouseArea  {
            id: markerMouseArea
            anchors.fill: parent
            hoverEnabled : false
            drag.target: marker
            preventStealing: true
            onReleased: {
                routeModel1.isFirstRoute = marker.isFirstRoute
                if (routeModel1.isFirstRoute) {
                    if (routeModel1.query.waypoints.length >= 2)
                        routeModel1.query.clearWaypoints();
                    routeModel1.query.addWaypoint(startMarker1.coordinate)
                    routeModel1.query.addWaypoint(finishMarker1.coordinate)
                }
                else {
                    if (routeModel1.query.waypoints.length >= 2)
                        routeModel1.query.clearWaypoints();
                    routeModel1.query.addWaypoint(startMarker2.coordinate)
                    routeModel1.query.addWaypoint(finishMarker2.coordinate)
                }

                routeModel1.update()
            }

        }
        Text {
            id: number
            text: qsTr("")
        }
    }
}
