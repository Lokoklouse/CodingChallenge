#include <QtDebug>
#include <QQmlEngine>
#include <QQmlComponent>

#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{
}

void ChatServer::registerClient()
{
    QObject::sender();
    /*your implementation here*/
    qDebug() << "registering";

    QQmlEngine engine;
    QQmlComponent component(&engine, "ChatWindow.qml");
    QObject *object = component.create();

//    clients.insert({object->objectName().toStdString(), object});

//    for (auto itr = clients.begin(); itr != clients.end(); ++itr) {
//            qDebug() << '\t' << itr->second << '\n';
//        }
}

void ChatServer::sendMessage()
{
    /*your implementation here*/
}

