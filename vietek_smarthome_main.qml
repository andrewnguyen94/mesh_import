import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0


Item {
    id: mainview
    width: 1280
    height: 768
    visible: true
    property int focusedBuilding: 100
    property int frames: 0
    property real buttonSize: (height < 2200) ? (height / 13) : 200

    Connections{
        target: networkController

        onCommandAccepted:{
            var focusedItem = mainview.Window.window.activeFocusItem
            if (focusedItem && focusedItem.panningEnabled) {
                focusedItem.panningEnabled = false
            }

        }
    }

    Scene3D{
        anchors.fill: parent
        aspects: ["render", "logic", "input"]


    }

    onFocusedBuildingChanged: {
        if(focusedBuilding == 100){

        }else{

        }
    }
}

