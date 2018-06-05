import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtLocation 5.9
import QtPositioning 5.8

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World1")



//    Item {
//        width: 200; height: 200

//        DropArea {
//            x: 75; y: 75
//            width: 50; height: 50

//            Rectangle {
//                anchors.fill: parent
//                color: "green"

//                visible: parent.containsDrag
//            }
//            onContainsDragChanged: console.log("dropped")
//        }

//        Rectangle {
//            x: 10; y: 10
//            width: 20; height: 20
//            color: "red"

//            Drag.active: dragArea.drag.active
//            Drag.hotSpot.x: 0
//            Drag.hotSpot.y: 0

//            MouseArea {
//                id: dragArea
//                anchors.fill: parent

//                drag.target: parent
//                onReleased: console.log("released")
//            }
//        }
//    }
        Plugin {
        id: mapPlugin
        name: "osm"
    }



    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin

        MyRoute {
            id: route
            plugin: mapPlugin

        }

        MouseArea {
            id: globalMouse
            anchors.fill: parent
            onClicked: {
                route.addStartWaypoint(startMarker.coordinate)
                startMarker.coordinate = map.toCoordinate(Qt.point(mouseX, mouseY))
                finishMarker.coordinate = map.toCoordinate(Qt.point(mouseX, mouseY))

                route.addFinishWaypoint(finishMarker.coordinate)
            }
        }

        Marker {
            id:startMarker
        }
        Marker {
            id:finishMarker
        }
    }

    Button {
        onClicked: {
            console.log(marker.x, marker.y)
            console.log(marker.coordinate)
        }
    }


//    Container {
//        id: container
//        contentItem: Repeater {
//            model: container.contentModel
//        }
//        Marker {
//            id:marker3
//        }
//        Rectangle {
//            width: 50
//            height: 50
//            border.color: "red"
//        }
//        Rectangle {
//            width: 50
//            height: 50
//            border.color: "green"
//        }
//    }
    Rectangle {
        width: 50
        height: 300

    Container {
        id: container
        anchors.fill: parent
        contentItem: ListView {
            model: container.contentModel
            snapMode: ListView.SnapOneItem
//            orientation: ListView.Horizontal
        }

        Image {
                id: image
                source: "qrc:/images/mapMarker.png"
                sourceSize.width: 48
                sourceSize.height: 48
                opacity: markerMouseArea.pressed ? 0.6 : 1.0
                MouseArea  {
                    id: markerMouseArea
                    property int pressX : -1
                    property int pressY : -1
                    property int jitterThreshold : 10
                    property int lastX: -1
                    property int lastY: -1
                    anchors.fill: parent
                    hoverEnabled : false
                            Drag.active: dragArea.drag.active
                    drag.target: marker
                    preventStealing: true

                    onPressed : {
                        map.pressX = mouse.x
                        map.pressY = mouse.y
                        map.currentMarker = -1
                        for (var i = 0; i< map.markers.length; i++){
                            if (marker == map.markers[i]){
                                map.currentMarker = i
                                break
                            }
                        }
                    }

                    onPressAndHold:{
                        if (Math.abs(map.pressX - mouse.x ) < map.jitterThreshold
                                && Math.abs(map.pressY - mouse.y ) < map.jitterThreshold) {
                            var p = map.fromCoordinate(marker.coordinate)
                            lastX = p.x
                            lastY = p.y
                            map.showMarkerMenu(marker.coordinate)
                        }
                    }
                }

                Text{
                    id: number
                    y: image.height/10
                    width: image.width
                    color: "white"
                    font.bold: true
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    Component.onCompleted: {
        //                text = "adasfdsdfsdfmsd.,fms.d,mf,sdmf,sdngmnsd"
                    }
                }

            }
        Rectangle {
            width: 50
            height: 50
            border.color: "red"
        }
        Rectangle {
            width: 50
            height: 50
            border.color: "green"
        }
    }
    }

}
