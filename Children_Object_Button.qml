import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle{
    id: children_object_button
    property alias text: children_object_button_text.Text
    property Item buttonSelector: parent.parent
    property alias focusChildObject: children_object_button.focusChildObject
    property int child_object_buttonSize: 140
    property int fontSize: 16

    color: "transparent"

//    Image {
//        id: children_object_button_image
//        anchors.fill: parent
//        property int focusChildObjects

//        MouseArea{

//        }

//    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {buttonSelector.focusChildObject = focusChildObject}
    }

    Text {
        id: children_object_button_text
        anchors.centerIn: parent
        font.family: "Helvetica"
        font.pixelSize: fontSize
        font.weight: Font.Light
        color: "black"
        opacity : {

        }
    }
}
