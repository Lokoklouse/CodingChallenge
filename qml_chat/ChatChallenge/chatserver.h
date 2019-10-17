#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QString>

class ChatServer : public QObject
{
    Q_OBJECT

    //Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)

public:
    explicit ChatServer(QObject *parent = nullptr);

    Q_INVOKABLE void registerClient(QString clientID, QObject *object);
    Q_INVOKABLE void sendMessage(QString username, QString message, QString color);

signals:
    void transmitMessage(QString userName, QString messageText, QString color);

private:
    std::map<std::string, QObject*>clients;
};

#endif // CHATSERVER_H
