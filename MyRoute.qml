import QtQuick 2.10
import QtLocation 5.9
import QtPositioning 5.8

Item {
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
}
