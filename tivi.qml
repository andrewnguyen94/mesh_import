import QtQuick 2.0 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0

Entity{
    id: root
    property Material material

    Mesh {
        id: toyplaneMesh
        source: "assets/obj/tivi.obj"
    }


}


