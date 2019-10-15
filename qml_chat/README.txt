Please use every resource available to you (just like any job). I am looking for
code clarity, consistency and organization. Be advised we will review and
discuss your code in follow-up interviews; be prepared to explain your code and
justify decisions made. For reference, this challenge took me 2.5 hours to
complete at a base level (Phase 1), expect it to take longer without previous
Qt/QML experience, and don't forget Phase 2.

We do most of our front end work in Qt/QML, so the front end coding challenge is
in QML and C++. See screenshot and video for a basic layout. See architecture
diagram for data flow. In the background of the video you will see some actual
code running from the editor. If you need clarification, ask.

It does not need to be networked, but can be for extra credit.


Recommended Workflow -----------------------------------------------------------

Environment Setup:
1) Create a Qt account and download the Qt installer from
        https://www.qt.io/download (open source version), use it to install a
        recent version of Qt (i.e. 5.12.2) which will include the QtCreator IDE.
        Use the attached ChatChallenge project to get started in QtCreator after
        install.

Phase 1: Basic Functionality and Technology Exploration (just get it working)
1) Lay out your base visual components in QML. I.e. use container Rectangle
        elements with borders to help visualize your initial application control
        layout:
                border {
                    color: "red";
                    width: 1
                }
        Think of this as your "floor plan" for your new house. Where are you
        going to put your kitchen, bedrooms?
2) Start with one element and get it capturing and displaying text into your
        console as well as your text output areas. Skip going through your C++
        object at this point.
3) Implement your C++ object. Make sure you can set and read properties (break
        this out into a different project to test if you need to learn)
4) Hook up your QML elements to your C++ object
5) Test and assure you have it all working

Phase 2: Refine and Improve (professionalize)
1) Make names (variables, files et al) and file organization clear
2) Clean up clunky code and document
3) Improve performance and code clarity

Break out the QML into separate components/files to make the main.qml
application easier to implement and read (this has been started in the project
with main.qml and ChatWindow.qml).

2 Phases are recommended because they prevent you from becoming overwhelmed
and distracted during Phase 1 with details that don't matter initially.
In Phase 2 you KNOW it works and you can make modifications and clean up one
step at a time and re-verify working state each iteration.


Resources (you may not need all of these) --------------------------------------

Qt/QML Introduction Book:
https://qmlbook.github.io/

Integrating QML and C++
http://doc.qt.io/qt-5/qtqml-cppintegration-topic.html

Qt Signals and Slots
http://doc.qt.io/qt-5/signalsandslots.html

QML Signal Handling
http://doc.qt.io/qt-5/qtqml-syntax-signals.html

// INPUTS
QML Button
https://doc.qt.io/qt-5.10/qml-qtquick-controls2-button.html

QML TextField
https://doc.qt.io/qt-5/qml-qtquick-controls2-textfield.html

// OUTPUTS
https://doc.qt.io/qt-5/qml-qtquick-textedit.html

Visually customizing QML Controls
https://doc.qt.io/qt-5/qtquickcontrols2-customize.html


Hints --------------------------------------------------------------------------

To help with the chat transcript and formatting- This will make a TextEdit
area that scrolls and allows HTML formatted text:

ScrollView { 
    id: chatTranscriptScroll
    anchors {
        // your anchors here
    }

    TextEdit {
        id: chatTranscriptText
        width: chatTranscriptScroll.width
        readOnly: true 
        textFormat: Text.RichText // enables HTML formatting
        wrapMode: TextEdit.Wrap
    } 
}

Another VERY useful hint/technique- Add the following semi-transparent Rectangle
to any other QML component and it will shade it “tomato” color so you can
see its exact position and size, as well as log what it believes is its height
and width, to make debugging layout and element positioning easy:

// insert anywhere inside another QML element to visualize its placement.
Rectangle {
    color: "tomato"
    opacity: .15
    anchors {
        fill: parent
    }
    z:20
    Component.onCompleted: {
        console.log("height: " + height + "\\n     width:  " + width)
    }
}

// Example usage:
Rectangle {
    id: chatWindow1
    …
    …

    // will highlight entire chatWindow1 with “color” to show its boundaries and
    // location on screen.
    Rectangle {
        color: "tomato"
        opacity: .15
        anchors {
            fill: parent
        }
        z:20
        Component.onCompleted: {
            console.log("height: " + height + "\\n     width:  " + width)
        }
    }
}

Use QML Controls 2 control elements - Controls 1 elements are deprecated, you'll
know you're using one if you import Qt.Quick Controls 1.x. Note that not
all Controls 1 controls exist in Controls 2 and vice versa (but most are).

The register() function does not need to be called by the user or shown in the
UI - the chat window clients should register with the server when they are
loaded - see QML 'Component.onCompleted'. Think Observer Pattern.
