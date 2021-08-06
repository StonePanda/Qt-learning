import QtQuick 2.0
import QtQuick.Particles 2.0
import "."

Emitter {
    property Item block: parent
    anchors.fill:parent
    shape: EllipseShape{
        fill: true
    }
    group: {
        if(block.type == 0){
            "redspots"
        }else if(block.type==1){
            "bluespots"
        }else if(block.type==2){
            "greenspots"
        }else{
            "yellowspots"
        }
    }
    size: Settings.blockSize*2
    endSize: Settings.blockSize/2
    lifeSpan: 30000
    enabled: false
    emitRate: 60
    maximumEmitted: 60
    velocity: PointDirection{
        y:4
        yVariation: 4
    }
}
