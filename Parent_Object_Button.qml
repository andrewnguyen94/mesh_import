import QtQuick 2.0

Rectangle{
    id: parent_object_button

    property alias text: parent_object_button_text.Text
    property alias source: parent_object_button_image.source
    property alias focusParentObject: parent_object_button_image.focusParentObject
    property Item buttonSelector: parent.parent
    property int parent_object_buttonSize: 70
    property int fontSize: 16

    width: parent_object_buttonSize
    height: parent_object_buttonSize
    color: "transparent"

    Image{
        id: parent_object_button_image
        anchors.fill: parent
        property int focusParentObject

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {buttonSelector.focusParentObject = focusParentObject}
            onEntered: PropertyAnimation{target: parent_object_button_text; property: "opacity"; to: 1}
            onExited: PropertyAnimation{
                target: parent_object_button_text
                property: "opacity"
                to: {
                    if (parent_object_button_text.text != "Solar System")
                       0
                    else
                       1
                }
            }
        }
    }

    Text{
        id: parent_object_button_text
        anchors.centerIn: parent
        font.family: "Helvetica"
        font.pixelSize: fontSize
        font.weight: Font.Light
        color: "white"
        opacity: {
            if (text == "Solar System" || (Qt.platform.os === "tvos" && parent_object_button.activeFocus))
                opacity = 1
            else
                opacity = 0
        }
    }
}
