import QtQuick 2.0
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0

Entity{
    id: building_advanced

    property real xLookAtOffset: 0
    property real yLookAtOffset: 0
    property real zLookAtOffset: 0
    property real defaulPosition: Qt.vector3d(0.0, 10.0, 20.0)

    Camera{
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: _window.width / _window.height
        nearPlane: 0.1
        farPlane: 1000.0
        position: defaulPosition
        viewCenter: Qt.vector3d(xLookAtOffset, yLookAtOffset, zLookAtOffset)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
    }

    FirstPersonCameraController {camera: camera}
}

