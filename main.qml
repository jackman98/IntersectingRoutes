import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtLocation 5.9
import QtPositioning 5.8
import Utilites 1.0

ApplicationWindow {
    id: mainWindow
    objectName: "mainmani"
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World1")

    Plugin {
        id: mapPlugin
        name: "here"
        PluginParameter {
            name: "here.app_id"
            value: "EyV8l0OdrgC41mMyosMj"
        }
        PluginParameter {
            name: "here.token"
            value: "5q7pDy4mOjasekDDiVdfaQ"
        }
    }
//    property Route route1//: routeManager.route1
//    property Route route2//: routeManager.route2

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin

        RouteManager {
            id: routeManager
            route1: route1
            route2: route2
        }

        Route {
            id: route1
//            path: routeManager.route1
        }

        Route {
            id: route2
//            path: routeManager.route2
        }

        DropArea {
            id: dropArea
            anchors.fill: parent
        }

        RouteQuery {
            id: query1
        }

        RouteModel {
            id: routeModel1
            query: query1
            plugin: mapPlugin
            autoUpdate: false
            property bool isFirstRoute
            onStatusChanged: {
                if (isFirstRoute) {
                    if (routeModel1.status == RouteModel.Ready) {
                        route1.path = routeModel1.get(0).path
                    }
                }
                else {
                    if (routeModel1.status == RouteModel.Ready) {
                        route2.path = routeModel1.get(0).path
                    }
                }
            }
        }

        MapRoute {
            id: mapRoute1
            route: route1
            line.color: "blue"
            line.width: 5
            smooth: true
            opacity: 0.8
        }

        MapRoute {
            id: mapRoute2
            route: route2
            line.color: "green"
            line.width: 5
            smooth: true
            opacity: 0.8
        }

        MapItemGroup {
            MapMarker {
                id: startMarker1
                nameMarker: "S1"
                isFirstRoute: true
            }
            MapMarker {
                id: finishMarker1
                nameMarker: "F1"
                isFirstRoute: true
            }
            MapMarker {
                id: startMarker2
                nameMarker: "S2"
                isFirstRoute: false
            }
            MapMarker {
                id: finishMarker2
                nameMarker: "F2"
                isFirstRoute: false
            }
        }
    }

    Rectangle {
        color: "transparent"
        width: 50
        height:  250
        DropArea {
            id: startDropArea
            anchors.fill: parent
        }
        Column {
            Marker {
                id: marker1
                text: "S1"
                owner: startMarker1
            }

            Marker {
                id: marker2
                text: "F1"
                owner: finishMarker1
            }

            Marker {
                id: marker3
                text: "S2"
                owner: startMarker2
            }

            Marker {
                id: marker4
                text: "F2"
                owner: finishMarker2

            }
            Button {
                onClicked: {
                    console.log(routeManager.intersect())
                }
            }
        }
    }
//    RowLayout {
//        width: parent.width / 2
//        height: parent.height
//        anchors.right: parent.right
//        ListView {
//            id: listview
//            Layout.fillHeight: true
//            Layout.fillWidth: true
//            spacing: 10
//            model: routeModel1.status == RouteModel.Ready ? routeModel1.get(0).segments : null
//            visible: model ? true : false
//            delegate: Row {
//                width: parent.width
//                spacing: 10
//                property bool hasManeuver : modelData.maneuver && modelData.maneuver.valid
//                visible: hasManeuver
//                Text { text: (1 + index) + "." }
//                Text { text: hasManeuver ? modelData.maneuver.instructionText : "" }
//            }
//        }
//    }
}
