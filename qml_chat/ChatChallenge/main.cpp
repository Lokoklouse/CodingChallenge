#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWidgets/QApplication>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include "QtDebug"
#include "chatserver.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<ChatServer>("CS", 1, 0, "ChatServer"); // http://doc.qt.io/qt-5/qqmlengine.html#qmlRegisterType
    ChatServer *chatServer = new ChatServer();
    engine.rootContext ()->setContextProperty ("chatServer", chatServer);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    int appResult = app.exec();
    return appResult;
}
