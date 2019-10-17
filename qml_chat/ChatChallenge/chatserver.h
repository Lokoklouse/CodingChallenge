#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QString>

/*!
 * \brief The ChatServer class
 * Class that handles the back end of sending and recieving messages,
 * as well as any extra formatting that is needed.
 */
class ChatServer : public QObject
{
    Q_OBJECT

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
