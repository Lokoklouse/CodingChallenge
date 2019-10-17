#include <QtDebug>
#include <QQmlEngine>
#include <QQmlComponent>

#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{
}

void ChatServer::registerClient(QString clientID, QObject *object)
{
    /*your implementation here*/
    qDebug() << "registering: " << clientID;

    clients.insert({clientID.toStdString(), object});
}

void ChatServer::sendMessage(QString username, QString message, QString color)
{
    /*your implementation here*/
    username += ": ";
    message += "\n";

    emit transmitMessage(username,message,color);
}

