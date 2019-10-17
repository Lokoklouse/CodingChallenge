import QtQuick 2.9
import QtQuick.Controls 2.5
import CS 1.0

Item {
    id: root
    objectName: name

    anchors {
        fill: parent
    }

    property var userNameData: "User"
    property var userNameColor: "red"
    property var name: "default"

    function sendMessage() {

        if(inputField.text != "")
        {
            console.log("Sending Message: <b><font color= " + userNameColor + ">" + userNameData +"</b></font>" + inputField.text)

            server.sendMessage(userNameData, inputField.text, userNameColor)

            inputField.clear()
        }
        else
            console.log("Nothing to send")
    }

    function acceptMessage(message, message2, color)
    {
        if(chatBoxText.text != "")
            chatBoxText.text += "<b><font color= " + color + ">" + message +"</b></font>" + message2
        else
            chatBoxText.text = "<b><font color= " + color + ">" + message +"</b></font>" + message2
    }

    Component.onCompleted: server.registerClient(name, this);

    Rectangle
    {
        id: userName
        height: 30
        width: parent.width

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
        id: inputField
        height: 30
        width: parent.width - sendButton.width
        anchors.top: userName.bottom

        placeholderText: qsTr("Enter Message...")

        onAccepted: sendMessage()

    }
    Rectangle
    {
        id: sendButton
        height: 30
        width: 80
        anchors.left: inputField.right
        anchors.top: inputField.top
        color: "light grey"
        border.color: "black"
        border.width: 1

        Text {
            id: sendText
            text: qsTr("Send")
            anchors.centerIn: parent
        }

        MouseArea {
            height: parent.height
            width: parent.width

            onClicked: sendMessage()
        }
    }

    TextEdit {
        id: chatBoxText
        textFormat: TextEdit.RichText
        height: parent.height - inputField.height - userName.height
        width: parent.width
        anchors.top: inputField.bottom
        readOnly: true
        objectName: "inputFieldthing"
    }

}
