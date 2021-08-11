import QtQuick 2.0
import QtQuick.Particles 2.0
import "samegame.js" as Logic
import "."

Item {
    id: gameCanvas
    property bool gameOver: true
    property int score: 0
    property int highScore: 0
    property int moves: 0
    property string mode: "" //mode 模式
    property ParticleSystem ps: particleSystem //粒子系统 Particle System

    //For easy theming 为了简单的主题
    property alias backgroundVisible: bg.visible
    property string background: "gfx/background.png"
    property string blockFile: "Block.qml"
    property int blockSize: Settings.blockSize
    onBlockFileChanged: Logic.changeBlock(blockFile);
    property alias particlePack: auxLoader.source

    //For multiplayer 多人游戏
    property int score2: 0
    property int curTurn: 1
    property bool autoTurnChange: false
    signal swapPlayers
    property bool swapping: false

    //onSwapPlayers: if(autoTurnChange) Logic.trunChange(); //Now implemented below 在下面实现了
    //For puzzle 拼图用
    property url level
    property bool puzzleWon: false
    signal puzzleLost //Since root is tracking the puzzle progress 由于 root 正在跟踪拼图进度
    function showPuzzleEnd(won){
        if(won){
            smokeParticle.color=Qt.rgba(0,1,0,0);
            puzzleWin.play();
        }else{
            smokeParticle.color=Qt.rgba(1,0,0,0);
            puzzleFail.play();
            puzzleLost();
        }
    }
    function showPuzzleGoal(str){
        puzzleTextBubble.opacity=1;
        puzzleTextLabel.text=str;
    }
    Image {
        id: bg
        z:-1
        anchors.fill: parent
        source: background
        fillMode: Image.PreserveAspectCrop
    }

    MouseArea{
        anchors.fill: parent;
        onClicked:{
            if(puzzleTextBubble.opacity==1){
                puzzleTextBubble.opacity=0
                Logic.finishLoadingMap()
            }else if(!swapping){
                Logic.handleClick(mouse.x,mouse.y)
            }
        }
    }
    Image {
        id: highScoreTextBubble
        opacity: mode == "arcade" && gameOver && gameCanvas.score == gameCanvas.highScore ? 1 : 0
        Behavior on opacity {
            NumberAnimation{

            }
        }
        anchors.centerIn: parent
        z:10
        source: "gfx/bubble-highscore.png"
        Image {
            anchors.centerIn: parent
            source: "gfx/text-highscore-new.png"
            rotation: -10
        }
    }
    Image {
        id: puzzleTextBubble
        anchors.centerIn: parent
        opacity: 0
        Behavior on opacity {
            NumberAnimation{

            }
        }
        z:10
        source: "gfx/bubble-puzzle.png"
        Connections{
            target: gameCanvas
            onModeChanged:if(mode!="puzzle"&&puzzleTextBubble.opacity>0) puzzleTextBubble.opacity=0
        }
        Text {
            id: puzzleTextLabel
            width:parent.width-24
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            font.pixelSize: 24
            font.bold: true
            wrapMode: Text.WordWrap
        }
        // @disable-check M16
        onModeChanged:{
            p1WonImg.opacity=0;
            p2WonImg.opacity=0;
        }
        SmokeText{
            id:puzzleWin
            source:"gfx/icon-ok.png"
            system:particleSystem
        }
        SmokeText{
            id:puzzleFail
            source:"gfx/icon-fail.png"
            system:particleSystem
        }
        // @disable-check M16
        onSwapPlayers:{
            smokeParticle.color="yellow"
            Logic.turnChange()
            if(curTurn==1){
                p1Text.play()
            }else{
                p2Text.play()
            }
            clickDelay.running=true
        }
        SequentialAnimation{
            id:clickDelay
            ScriptAction{
                script: gameCanvas.swapping=true
            }

            PauseAnimation {
                duration: 750
            }
            ScriptAction{
                script: gameCanvas.swapping=false
            }
        }
        SmokeText{
            id:p1Text
            source:"gfx/text-p1-go.png"
            system:particleSystem;
            playerNum:1
            opacity:p1WonImg.opacity+p2WonImg.opacity>0?0:1
        }
        SmokeText{
            id:p2Text
            source:"gfx/text-p2-go.png"
            system:particleSystem
            playerNum:2
            opacity:p1WonImg.opacity+p2WonImg.opacity>0?0:1
        }
        // @disable-check M16
        onGameOverChanged:{
            if(gameCanvas.mode=="multiplayer"){
                if(gameCanvas.score>=gameCanvas.score2){
                    p1WonImg.opacity=1
                }else{
                    p2WonImg.opacity=1
                }
            }
        }
        Image {
            id: p1WonImg
            source: "gfx/text-p1-won.png"
            anchors.centerIn: parent
            opacity: 0
            Behavior on opacity {
                NumberAnimation{

                }
            }
            z:10
        }
        Image {
            id: p2WonImg
            source: "gfx/text-p2-won.png"
            anchors.centerIn: parent
            opacity: 0
            Behavior on opacity {
                NumberAnimation{

                }
            }
            z:10
        }
        ParticleSystem{
            id:particleSystem
            anchors.fill: parent
            z:5
            ImageParticle{
                id:smokeParticle
                groups: ["smoke"]
                source:"gfx/particle-smoke.png"
                alpha: 0.1
                alphaVariation: 0.1
                color: "yellow"
            }
            Loader{
                id:auxLoader
                anchors.fill: parent
                source: "PrimaryPack.qml"
                onItemChanged: {
                    if(item && "particleSystem" in item)
                        item.particleSystem=particleSystem
                    if(item&&"gameArea" in item)
                        item.gameArea=gameCanvas
                }
            }
        }
    }
}
