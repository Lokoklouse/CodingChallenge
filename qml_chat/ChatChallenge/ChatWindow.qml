import QtQuick 2.9
import QtQuick.Controls 2.5

Item {
    id: root
    anchors {
        fill: parent
    }

    property var userNameData: "User"
    property var userNameColor: "red"

    function sendMessage() {

        chatServer.sendMessage()
        console.log("Sending: ", userNameText.text + ": " + textBox.text + "\n")

        textSender(userNameText.text + ": ", textBox.text + "\n", userNameColor)
        textBox.clear()
    }

    function acceptMessage(message, message2, color)
    {
        chatBoxText.text += "<b><font color= " + color + ">" + message +"</b></font>" + message2
    }

    Rectangle
    {
        id: userName
        height: 30
        width: parent.width
        border.color: "red"
        border.width: 1

        Text {
            id: userNameText
            text: userNameData
            color: "blue"
            font.bold: true
            font.pointSize: 14
        }
    }

    TextField
    {
        id: textBox
        height: 30
        width: parent.width - sendButton.width
        anchors.top: userName.bottom
        onAccepted: sendMessage();

    }
    Rectangle
    {
        id: sendButton
        height: 30
        width: 80
        anchors.left: textBox.right
        anchors.top: textBox.top
        border.color: "green"
        border.width: 1

        Text {
            id: sendText
            text: qsTr("Send")
            anchors.centerIn: parent
        }

        MouseArea {
            height: parent.height
            width: parent.width

            onClicked: sendMessage();
        }
    }
    TextEdit {
        id: chatBoxText
        textFormat: TextEdit.RichText
        height: parent.height - textBox.height - userName.height
        width: parent.width
        anchors.top: textBox.bottom
        readOnly: true
        objectName: "textboxthing"
    }

    Component.onCompleted: chatServer.registerClient();

    // Add your chat transcript box, message input box, and message sending button here
}
