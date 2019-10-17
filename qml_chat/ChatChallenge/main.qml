import QtQuick 2.9
import QtQuick.Window 2.2
import CS 1.0

Window {
    id: window1
    visible: true
    width: 500
    height: 500
    title: qsTr("Chat Window 1")

    ChatServer {
        id: server

        //Post the message to the chat windows
        //Signal contains 3 strings userName, messageText, color
        onTransmitMessage: {
            chat1.acceptMessage(userName, messageText, color)
            chat2.acceptMessage(userName, messageText, color)
        }
    }

    ChatWindow {
        id: chat1
        name: "ChatWindow1"
        userNameData: "Brian"
    }

    Window {
        id: window2
        visible: true
        width: 500
        height: 500
        title: qsTr("Chat Window 2")

        ChatWindow {
            id: chat2
            name: "ChatWindow2"
            userNameData: "CodingChallenge"
            userNameColor: "blue"
        }
    }
}
