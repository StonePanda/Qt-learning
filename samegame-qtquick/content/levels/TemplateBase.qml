import QtQuick 2.0

Rectangle{
    id:control
    property int scoreTarget: -1
    property int timeTarget: -1
    property int moveTarget: -1
    property bool mustClear: true

    property string goalText: "Clear the level..."

    property var startingGrid

    width:320
    height: 416
    color: "white"
}
