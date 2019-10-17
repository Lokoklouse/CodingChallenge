import QtQuick 2.9
import QtQuick.Controls 2.5
import CS 1.0

Item {
    id: root
    objectName: name

    anchors {
        fill: parent
    }

    //properties
    property var userNameData: "User"
    property var userNameColor: "red"
    property var name: "default"

    //Message sender function.
    //Created to avoid copying code into the send button as well as the text field
    function sendMessage() {

        if(inputField.text != "") //If the message field isn't empty
        {
            console.log("Sending Message: <b><font color= " + userNameColor + ">" + userNameData +"</b></font>" + inputField.text)

            //Chat server message handler function
            server.sendMessage(userNameData, inputField.text, userNameColor)

            //Clear the inputField since we sent the message
            inputField.clear()
        }
        else //Empty input, send no message
            console.log("Nothing to send")
    }

    //function that accepts the message and posts it to the rich text field with the required formatting
    function acceptMessage(message, message2, color)
    {
        chatBoxText.text += "<b><font color= " + color + ">" + message +"</b></font>" + message2
    }

    //Once created register with the C++ class
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

    //Text input field for users to input in. Contains placeholder text
    //Text field is used to get enter key functionality
    TextField
    {
        id: inputField
        height: 30
        width: parent.width - sendButton.width
        anchors.top: userName.bottom
        font.pointSize: 12

        placeholderText: qsTr("Enter Message...")

        onAccepted: sendMessage()
    }

    //Send button for sending a message on click
    Button
    {
        id: sendButton
        height: inputField.height
        width: 80
        anchors.left: inputField.right
        anchors.top: inputField.top
        text: qsTr("Send")

        onClicked: sendMessage()
//        color: "light grey"
//        border.color: "black"
//        border.width: 2
    }

    //ScrollView for the chat window in case the chat gets outside the window
    ScrollView {
        id: chatScrollView
        height: parent.height - inputField.height - userName.height
        width: parent.width
        anchors.top: inputField.bottom
        clip: true

        TextEdit {
            id: chatBoxText
            height: parent.height
            width: parent.width
            anchors.top: parent.top
            textFormat: TextEdit.RichText
            wrapMode: TextEdit.Wrap
            readOnly: true //readonly so the user can't type in the text edit
            font.pointSize: 12
            Component.onCompleted: chatBoxText.clear()
        }
    }
}
