TEMPLATE=app
QT +=qml quick sql

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += \ # qml.qrc #所有资源 在IDE里更改后这里会自动更改qrc文件的名字
    samegame.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
#原路径
qnx: target.path =/tmp/$${TARGET}/bin #$$[QT_INSTALL_EXAMPLES]/demos/samegame 教程里的路径
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
