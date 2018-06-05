import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtLocation 5.9
import QtPositioning 5.8

ApplicationWindow {
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


//    MyRoute {
//        id: route1
//        color: "red"
//        plugin: mapPlugin

//    }
//    MyRoute {
//        id: route2
//        color: "green"
//        plugin: mapPlugin

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        DropArea {
            id: dropArea
            anchors.fill: parent
        }


        //        MouseArea {
        //            id: globalMouse
        //            anchors.fill: parent
        //            onClicked: {
        //                route.addStartWaypoint(startMarker.coordinate)
        //                startMarker.coordinate = map.toCoordinate(Qt.point(mouseX, mouseY))
        //                finishMarker.coordinate = map.toCoordinate(Qt.point(mouseX, mouseY))

        //                route.addFinishWaypoint(finishMarker.coordinate)
        //            }
        //        }

        function setRoute(startCoord, finishCoord) {
            if (routeModel1.query.waypoints.length >= 2)
                routeModel1.query.clearWaypoints();
            routeModel1.query.addWaypoint(startCoord)
            routeModel1.query.addWaypoint(finishCoord)
        }

        RouteQuery {
            id: query1
        }

        RouteQuery {
            id: query2
        }

        RouteModel {
            id: routeModel1
            query: query1
            plugin: mapPlugin
//            autoUpdate: true
        }
        RouteModel {
            id: routeModel2
            query: query2
            plugin: mapPlugin
//            autoUpdate: true
        }

        MapItemView {
            id: mapItemView
            model: routeModel1
            delegate: MapRoute {
                id: mapRoute
                route: routeData
                line.color: "blue"
                line.width: 5
                smooth: true
                opacity: 0.8
            }
        }

        MapItemView {
            id: mapItemView1
            model: routeModel2
            delegate: MapRoute {
                id: mapRoute1
                route: routeData
                line.color: "yellow"
                line.width: 15
                smooth: true
                opacity: 0.8
            }
        }

        MapItemGroup {
            MapMarker {
                id: startMarker1
                nameMarker: "S1"
            }
            MapMarker {
                id: finishMarker1
                nameMarker: "F1"
            }
            MapMarker {
                id: startMarker2
                nameMarker: "S2"
            }
            MapMarker {
                id: finishMarker2
                nameMarker: "F2"
            }
        }
    }

    Column {
        Rectangle {
            id: rect1
            x: 10; y: 10
            width: 20; height: 20
            color: "red"

            Drag.active: dragArea1.drag.active
            Drag.hotSpot.x: 10
            Drag.hotSpot.y: 10

            MouseArea {
                id: dragArea1
                anchors.fill: parent

                drag.target: parent
                onReleased: {
                    if (dropArea.containsDrag === true) {
                        startMarker1.coordinate = map.toCoordinate(Qt.point(rect1.x, rect1.y))
                        rect1.visible = false
                    }
                }

            }
        }
        Rectangle {
            id: rect2
            x: 10; y: 10
            width: 20; height: 20
            color: "green"

            Drag.active: dragArea2.drag.active

            MouseArea {
                id: dragArea2
                anchors.fill: parent

                drag.target: parent
                onReleased: {
                    if (dropArea.containsDrag === true) {
                        finishMarker1.coordinate = map.toCoordinate(Qt.point(rect2.x, rect2.y))
                        rect2.visible = false
                    }
                }

            }
        }
        Rectangle {
            id: rect3
            x: 10; y: 10
            width: 20; height: 20
            color: "red"

            Drag.active: dragArea3.drag.active
            Drag.hotSpot.x: 10
            Drag.hotSpot.y: 10

            MouseArea {
                id: dragArea3
                anchors.fill: parent

                drag.target: parent
                onReleased: {
                    if (dropArea.containsDrag === true) {
                        startMarker2.coordinate = map.toCoordinate(Qt.point(rect3.x, rect3.y))
                        rect3.visible = false
                    }
                }

            }
        }
        Rectangle {
            id: rect4
            x: 10; y: 10
            width: 20; height: 20
            color: "green"

            Drag.active: dragArea4.drag.active

            MouseArea {
                id: dragArea4
                anchors.fill: parent

                drag.target: parent
                onReleased: {
                    if (dropArea.containsDrag === true) {
                        finishMarker2.coordinate = map.toCoordinate(Qt.point(rect4.x, rect4.y))
                        rect4.visible = false
                    }
                }

            }
        }
        Button {
            onClicked: {
//                routeModel1.query = query1
//                mapItemView.model = routeModel1
                if (routeModel1.query.waypoints.length >= 2)
                    routeModel1.query.clearWaypoints();
                routeModel1.query.addWaypoint(startMarker1.coordinate)
                routeModel1.query.addWaypoint(finishMarker1.coordinate)
                console.log("B1")
                console.log(routeModel1)
                console.log(routeModel1.count)
                console.log(query1)
                console.log(query2)
                console.log("~B1")
            }
        }
        Button {
            onClicked: {
//                routeModel2.query = query2
//                mapItemView1.model = routeModel2
                if (routeModel2.query.waypoints.length >= 2)
                    routeModel2.query.clearWaypoints();
                routeModel2.query.addWaypoint(startMarker2.coordinate)
                routeModel2.query.addWaypoint(finishMarker2.coordinate)
                console.log("B2")
                console.log(routeModel2)
                console.log(routeModel2.count)
                console.log(query1)
                console.log(query2)
                console.log("~B2")
            }
        }
        Button {
            onClicked: {
                //map.update()
                routeModel2.update()
                routeModel1.update()
                console.log(map.mapItems.length)
            }
        }
    }
    RowLayout {
        width: parent.width / 2
        height: parent.height
        anchors.right: parent.right
        ListView {
            id: listview
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 10
            model: routeModel1.status == RouteModel.Ready ? routeModel1.get(0).segments : null
            visible: model ? true : false
            delegate: Row {
                width: parent.width
                spacing: 10
                property bool hasManeuver : modelData.maneuver && modelData.maneuver.valid
                visible: hasManeuver
                Text { text: (1 + index) + "." }
                Text { text: hasManeuver ? modelData.maneuver.instructionText : "" }
            }
        }
//        ListView {
//            id: listview2
//            Layout.fillHeight: true
//            Layout.fillWidth: true
//            spacing: 10
//            model: route2.model.status == RouteModel.Ready ? route2.model.get(0).segments : null
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
    }
}
