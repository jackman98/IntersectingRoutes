import QtQuick 2.10

Image {
        id: image
        property alias text: number.text
        source: "qrc:/images/mapMarker.png"
        sourceSize.width: 48
        sourceSize.height: 48
        opacity: markerMouseArea.pressed ? 0.6 : 1.0
        MouseArea  {
            id: markerMouseArea
//            property int pressX : -1
//            property int pressY : -1
            property int jitterThreshold : 10
            property int lastX: -1
            property int lastY: -1
            anchors.fill: parent
            hoverEnabled : false
            drag.target: marker
            preventStealing: true

//            onPressed : {
////                map.pressX = mouse.x
////                map.pressY = mouse.y
////                map.currentMarker = -1
////                for (var i = 0; i< map.markers.length; i++){
////                    if (marker === map.markers[i]){
////                        map.currentMarker = i
////                        break
////                    }
////                }
//            }

//            onPressAndHold:{
////                if (Math.abs(map.pressX - mouse.x ) < map.jitterThreshold
////                        && Math.abs(map.pressY - mouse.y ) < map.jitterThreshold) {
//                    var p = map.fromCoordinate(marker.coordinate)
//                    lastX = p.x
//                    lastY = p.y
////                    map.showMarkerMenu(marker.coordinate)
////                }
//            }
            Text {
                id: number
                text: qsTr("")
            }
        }
    }
