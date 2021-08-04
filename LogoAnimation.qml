import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    id: container
    property alias running: mainAnim.running
    property ParticleSystem particleSystem
    property int dur: 500
    signal boomTime
    Image {
        id: s1
        source: "gfx/logo-s.png"
    }
}
