import QtQuick 2.0
import QtQuick.Particles 2.0
//Needed for singletons QTBUG-34418
import "."

Emitter {
    property Item block: parent
    velocity: TargetDirection{
        targetX: block.width/2;
        targetY: block.height/2;
        magnitude: -40;
        magnitudeVariation: 40
    }
    acceleration: TargetDirection{ //加速度
        targetX: block.width/2;
        targetY: block.height/2;
        magnitude: -100; //magnitude 震级
    }
    shape: EllipseShape{
        fill: true
    }
    enabled: false;
    lifeSpan: 700;//lifeSpan 寿命
    lifeSpanVariation: 100 //lifeSpanVariation 寿命变化？
    emitRate: 1000 //emitRate 发射率
    maximumEmitted: 100 //only fires 0.1s bursts (still 2x old number)仅发射 0.1 秒连发（仍然是旧数字的 2 倍）
    size: Settings.blockSize * 0.85
    endSize: Settings.blockSize * 0.85 /2
}
