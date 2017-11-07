import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0


Item {
    id: mainview
    width: 1280
    height: 768
    visible: true
    property int focusedParentObjects: 100
    property int frames: 0
    property int sliderLength: (width < height) ? width / 2 : height / 2
    property int textSize: sliderLength / 20
    property real buttonSize: (height < 2200) ? (height / 13) : 200
    property real child_object_buttonSize: (height < 2200) ? (height / 10) : 200
    property variant buildings: ["building_01", "building_02", "building_03"]
    property variant smart_objects: ["điều hòa", "tủ lạnh", "đèn ngủ", "đèn tường", "quạt", "tivi"]

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
        BuildingAdvanced: {id: building_advanced}
    }

    onFocusedParentObjectsChanged: {
        if(focusedBuilding == 100){
            child_objects.visible = false
            update_child_objects()
        }else{
            child_objects.visible = true
            update_child_objects()
        }
    }

    ListModel{
        id : parent_object_model

        ListElement{
            name : "Buildings"
            ImageSource : "images/building.png"
            object_number: 0
        }

        ListElement{
            name : "Smart_Objects"
            ImageSource : "images/smart_objects"
            object_number : 1
        }
    }

    Component{
        id: parent_object_delegate
        Parent_Object_Button{
            source : ImageSource
            text: name
            focusParentObject: object_number
            buttonSelector: mainview
            parent_object_buttonSize: buttonSize
            fontSize: textSize

            scale: activeFocus ? 1.4 : 1.0


        }
    }

    ListView{
        id: parent_objects
        property alias focusChildObject: 200
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: buttonSize / 4
        anchors.right : parent.right
        height: childrenRect.height
        spacing: buttonSize / 6
        width: buttonSize * 1.4
        interactive: false
        model : parent_object_model
        delegate: parent_object_delegate

        onFocusChildObjectChanged: {
            if(focusChildObject !== 200){

            }
        }
    }

    ListModel{
        id: child_object_models
    }

    Component{
        id: child_object_delegate

        Children_Object_Button{
            text: name
            focusChildObject: number
            buttonSelector: parent_objects
            child_object_buttonSize: child_object_buttonSize
            fontSize: textSize

            scale: activeFocus ? 1.4 : 1.0

        }
    }

    ListView{
        id:child_objects
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent_objects.left
        anchors.rightMargin: 40
        visible: false
        height: childrenRect.height
        width: get_max_child() * textSize
        interactive: false
        model: child_object_models
        delegate:child_object_delegate
    }

    function get_max_length_buildings(){
        var max = 0
        for(var i = 0; i < buildings.length; ++i){
            if(max < buildings[i].length) max = buildings[i].length
        }
        return max
    }

    function get_max_length_smart_objects(){
        var max = 0
        for(var i = 0; i < smart_objects.length; ++i){
            if(max < smart_objects[i].length) max = smart_objects[i].length
        }
        return max
    }

    function get_max_child(){
        var max_1 = get_max_length_buildings()
        var max_2 = get_max_length_smart_objects()
        return (max_1 > max_2) ? max_1 : max_2
    }

    function update_child_objects(){
        if(focusedParentObjects !== 100){
            name = child_object_models.get(focusedParentObjects).name
            if(name == "Buildings"){
                for(var i = 0; i < buildings; ++i){
                    child_object_models.append({name:buildings[i], number: i})
                }
            }else if(name == "Smart_Objects"){
                for(var i = 0; i < smart_objects; ++i){
                    child_object_models.append({name:smart_objects[i], number: i})
                }
            }
        }else{
            child_object_models.clear()
        }
    }
}

