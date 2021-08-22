import QtQuick 2.0
import "."

Text {
    font.pixelSize: Settings.fontPixelSize
    color: "white"
    textFormat: Text.StyledText
    Behavior on opacity {
        NumberAnimation{

        }
    }
}
