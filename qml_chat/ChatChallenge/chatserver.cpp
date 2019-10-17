#include <QtDebug>
#include <QQmlEngine>
#include <QQmlComponent>

#include "chatserver.h"
ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{
}

/*!
 * \brief ChatServer::registerClient
 * \param clientID = Client object name
 * \param object = the client object
 * \details Registers the client to the map and sets
 * any needed properties for the clients
 */
void ChatServer::registerClient(QString clientID, QObject *object)
{
    qDebug() << "registering: " << clientID;

    //insert the client into the map to register them to the chat session
    clients.insert({clientID.toStdString(), object});
}

/*!
 * \brief ChatServer::sendMessage
 * \param username = clients username
 * \param message = user entered message
 * \param color = users color for user name
 */
void ChatServer::sendMessage(QString username, QString message, QString color)
{
    //Add message specific punctuation
    username += ": ";
    message += "\n";

    //Emit the message for the chat windows to accept
    emit transmitMessage(username,message,color);
}

