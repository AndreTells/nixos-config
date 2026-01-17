import Quickshell
import QtQuick

Rectangle {
  required property color element_surfaceColor;
  required property color element_textOnSurfaceColor;

  Timer {
    running: true
    repeat: true
    interval: 1000

    onTriggered: date = new Date();
  }
	property var date: new Date()

  implicitWidth: 100 
  implicitHeight: parent.height * 0.9
  radius: parent.height * 0.8 /2
  color: element_surfaceColor

  Text {
    anchors.centerIn: parent
    text: `${date.getHours().toString().padStart(2,0)}:${date.getMinutes().toString().padStart(2,0)} `
    color: element_textOnSurfaceColor
    font.pixelSize: 16
  }
}
