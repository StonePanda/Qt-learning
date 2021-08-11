import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    id:container
    property ParticleSystem particleSystem
    property GameArea gameArea
    onGameAreaChanged: bgstacker.parent=gameArea
    Item {
        id: bgstacker
        z:0
        ImageParticle{
            groups: ["yellowspots"]
            color: Qt.darker("yellow")
            system: particleSystem
            source: "gfx/particle-paint.png"
            colorVariation: 0.2
            alpha: 0.2
            entryEffect: ImageParticle.None
        }
        ImageParticle{
            groups: ["redspots"]
            system: particleSystem
            color: Qt.darker("red")
            source: "gfx/particle-paint.png"
            colorVariation: 0.2
            alpha: 0.2
            entryEffect: ImageParticle.None
        }
        ImageParticle{
            groups: ["greenspots"]
            system: particleSystem
            color: Qt.darker("green")
            source:"gfx/particle-paint.png"
            colorVariation: 0.2
            alpha: 0.2
            entryEffect: ImageParticle.None
        }
        ImageParticle{
            groups: ["bluespots"]
            system: particleSystem
            color: Qt.darker("blue")
            source: "gfx/particle-paint.png"
            colorVariation: 0.2
            alpha: 0.2
            entryEffect: ImageParticle.None
        }
    }
    ImageParticle{
        groups: ["yellow"]
        system: particleSystem
        color: Qt.darker("yellow")
        source: "gfx/particle-brick.png"
        colorVariation: 0.4
        alpha: 0.1
    }
    ImageParticle{
        groups: ["red"]
        system: particleSystem
        color: Qt.darker("red")
        source: "gfx/particle-brick.png"
        colorVariation: 0.4
        alpha: 0.1
    }
    ImageParticle{
        groups: ["green"]
        system: particleSystem
        color: Qt.darker("green")
        source: "gfx/particle-brick.png"
        colorVariation: 0.4
        alpha: 0.1
    }
    ImageParticle{
        groups: ["blue"]
        system: particleSystem
        color: Qt.darker("blue")
        source: "gfx/particle-brick.png"
        colorVariation: 0.4
        alpha: 0.1
    }
}
