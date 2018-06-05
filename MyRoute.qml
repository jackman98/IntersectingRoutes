import QtQuick 2.10
import QtLocation 5.9
import QtPositioning 5.8

Item {
    property alias plugin: routeModel.plugin
    property alias model: routeModel
    property alias item: mapItemView
    property string color: "blue"
//    property alias query: routeModel.query

    function setRoute(startCoord, finishCoord) {
        if (routeModel.query.waypoints.length >= 2)
            routeModel.query.clearWaypoints();
        routeModel.query.addWaypoint(startCoord)
        routeModel.query.addWaypoint(finishCoord)
    }

    Component.onCompleted: {
        map.addMapItemView(item)
        console.log("afasf", routeModel.query)
    }

    RouteQuery {
        id: query1
    }

    RouteModel {
        id: routeModel
        query: query1
        plugin: map.plugin
        autoUpdate: true
    }

    MapItemView {
        id: mapItemView
        model: routeModel
        delegate: MapRoute {
            id: mapRoute
            route: routeData
            line.color: color
            line.width: 5
            smooth: true
            opacity: 0.8
        }
    }

}
