import QtQuick 2.0
import QtQuick.Particles 2.0

Emitter {
    anchors.fill: parent
    velocity: AngleDirection{
        angleVariation: 360
        magnitude: 140
        magnitudeVariation: 40
    }
    enabled: false
    lifeSpan: 500
    emitRate: 1
    size: 28
    endSize: 14
    group: "yellow"
}
