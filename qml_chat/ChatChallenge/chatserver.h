#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QString>

class ChatServer : public QObject
{
    Q_OBJECT

public:
    explicit ChatServer(QObject *parent = nullptr);

    Q_INVOKABLE void registerClient(/*your implementation here*/);
    Q_INVOKABLE void sendMessage(/*your implementation here*/);

private:
    std::map<std::string, QObject*>clients;
};

#endif // CHATSERVER_H
