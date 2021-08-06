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
        y:0
    }
    Image {
        id: g1
        source: "gfx/logo-g.png"
        y:-128
    }
    Column{
        Repeater{
            model:2
            Item {
                width:48
                height: 48
                BlockEmitter{
                    id:emitter
                    anchors.fill: parent
                    group: "red"
                    system: particleSystem
                    Connections{
                        target: container
                        onBoomTime: emitter.pulse(100)
                    }
                }
            }
        }
    }
    SequentialAnimation{
        id:mainAnim
        running: true
        loops: -1
        PropertyAction{
            target: g1
            property: "y"
            value: -128
        }
        PropertyAction{
            target: g1
            property: "opacity"
            value: 1
        }
        PropertyAction{
            target: s1
            property: "y"
            value: "0"
        }
        PropertyAction{
            target: s1
            property: "opacity"
            value: 1
        }
        NumberAnimation{
            target: g1
            property: "y"
            from:-96
            to:-48
            duration: dur
        }
        ParallelAnimation{
            NumberAnimation{
                target: g1
                property: "y"
                from:-48
                to:0
                duration: dur
            }
            NumberAnimation{
                target: s1
                property: "y"
                from:0
                to:48
                duration: dur
            }
        }

        PauseAnimation {
            duration: dur
        }
        ScriptAction{
            script: container.boomTime()
        }
        ParallelAnimation{
            NumberAnimation{
                target: g1
                property: "opacity"
                to:0
                duration: dur
            }
            NumberAnimation{
                target: s1
                property: "y"
                to:0
                duration: dur
            }
        }
        PropertyAction{
            target: s1
            property: "y"
            value: -128
        }
        PropertyAction{
            target: s1
            property: "opacity"
            value: 1
        }
        NumberAnimation{
            target: "s1"
            property: "y"
            from:-96
            to:0
            duration: dur*2
        }
    }
}
