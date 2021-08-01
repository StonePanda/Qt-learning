TEMPLATE = app
TARGET = notepad


QT += widgets

#the project file
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets #原来的文件里的东西，不太懂？

CONFIG += c++11   #原来的文件里的东西，不太懂？

qtHaveModule(printsupport): QT += printsupport #文档里要加的
requires(qtConfig(fontdialog))
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    notepad.cpp

HEADERS += notepad.h

FORMS += notepad.ui

RESOURCES += \
    notepad.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin   #原来的文件里的东西，不太懂？
else: unix:!android: target.path = /opt/$${TARGET}/bin   #原来的文件里的东西，不太懂？
!isEmpty(target.path): INSTALLS += target   #原来的文件里的东西，不太懂？

#install
#target.path = $$[QT_INSTALL_EXAMPLES]/widgets/tutorials/notepad 文档里的代码要加的，其实没加也没事儿
#INSTALLS += target

#INCLUDEPATH += C:\Qt\Tools\mingw810_64\lib\gcc\x86_64-w64-mingw32\8.1.0\include\c++ #之前de'bug试图加的，不用加，是其他的bug

RC_ICONS = "images/logo.ico"
