#ifndef NOTEPAD_H
#define NOTEPAD_H

#include <QMainWindow>
//the header file of the notepad class for the notepad widget

//以下几行在 Ui 命名空间中声明了 Notepad 类，这是 uic 工具从 .ui 文件生成的 UI 类的标准命名空间：
QT_BEGIN_NAMESPACE
namespace Ui { class Notepad; }
QT_END_NAMESPACE

class Notepad : public QMainWindow
{
    Q_OBJECT

public:
    explicit Notepad(QWidget *parent = nullptr);//explicit用于修饰类的构造函数，表明该构造函数是显式的，
    //下面这行声明了一个虚拟析构函数来释放对象在其生命周期中获取的资源。
    ~Notepad();
private slots: //槽是普通的 C++ 成员函数，可以被正常调用，它们唯一的特殊性就是很多信号可以与其相关联。
    void newDocument();
    void open();
    void save();
    void saveAs();
    void print();
    void exit();
    void copy();
    void cut();
    void paste();
    void undo();
    void redo();
    void selectFont();
    void setFontBold(bool bold);
    void setFontUnderline(bool underline);
    void setFontItalic(bool italic);
    void about();

private:
    Ui::Notepad *ui;
    QString currentFile;
};
#endif // NOTEPAD_H
