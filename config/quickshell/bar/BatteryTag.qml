import Quickshell.Services.UPower
import Quickshell
import QtQuick

Rectangle{
  required property color element_surfaceColor;
  required property color element_textOnSurfaceColor;

  implicitWidth: 100 
  implicitHeight: parent.height * 0.9
  radius: parent.height * 0.8 /2
  color: element_surfaceColor

  Text {
    anchors.centerIn: parent
    text: `   ${Math.round(UPower.displayDevice.percentage*100)} %`
    //text: "test"
    color: element_textOnSurfaceColor
    font.pixelSize: 16
  }
}
