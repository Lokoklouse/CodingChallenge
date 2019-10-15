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

    }

    ChatWindow {
        id: chat1
        userNameData: "Brian"
        // Set this chat instance's specific properties here
    }

    Window {
        id: window2
        visible: true
        width: 500
        height: 500
        title: qsTr("Chat Window 2")

        ChatWindow {
            id: chat2
            userNameData: "CodingChallenge"
            userNameColor: "blue"
            // Set this chat instance's specific properties here
        }
    }

    function textSender(message1, message2, color){
        chat1.acceptMessage(message1, message2, color)
        chat2.acceptMessage(message1, message2, color)
    }
}
