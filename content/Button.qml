import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    property alias imgSrc: image.source //alias 别名
    property alias system: emitter.system //emitter 发射器
    property alias group: emitter.group
    signal clicked
    property bool rotatedButton: false

    width:image.width
    height:image.sourceSize.height
    Image {
        id: image
        height: parent.height
        width: height/sourceSize.height * sourceSize.width

        anchors.horizontalCenter: parent.horizontalCenter
        rotation: rotatedButton ?((Math.random()*3+2) *(Math.random()<=0.5?-1:1)):0
        MenuEmitter{
            id: emitter
            anchors.fill:parent
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            parent.clicked();
            emitter.burst(400);
        }
    }
}
