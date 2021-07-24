#include "notepad.h"
#include <QApplication>
//the main source file for the application

int main(int argc, char *argv[])
{
    QApplication EditorApp(argc, argv);
    Notepad Editor;
    Editor.show();
    return EditorApp.exec();
}
