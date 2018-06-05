import QtQuick 2.10
import QtLocation 5.11
import QtPositioning 5.8

Item {
    property alias plugin: routeModel.plugin
    property alias model: routeModel
    property alias item: mapItemView
    property Waypoint start

    Waypoint {

    }

    function addStartWaypoint(coord) {
        if (myQuery.waypoints.count >= 1)
            myQuery.removeWaypoint(myQuery.waypoints[0])
        myQuery.addWaypoint(coord)
    }

    function addFinishWaypoint(coord) {
        if (myQuery.waypoints.count === 2)
            myQuery.removeWaypoint(myQuery.waypoints[1])
        myQuery.addWaypoint(coord)
    }

    Component.onCompleted: {
        map.addMapItemView(item)
    }

    RouteModel {
        id: routeModel
        plugin: map.plugin
        query: RouteQuery {
            id: myQuery
        }
        autoUpdate: true
    }

    MapItemView {
        id: mapItemView
        model: routeModel
        delegate: MapRoute {
            route: routeData
            line.color: "blue"
            line.width: 5
            smooth: true
            opacity: 0.8
        }
    }

}
