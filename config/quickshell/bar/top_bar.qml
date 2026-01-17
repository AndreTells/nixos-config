import Quickshell.Widgets
import Quickshell
import Quickshell.Wayland
import QtQuick.Layouts
import QtQuick

Scope{
  property color surfaceColor: "#ff212529"
  property color textOnSurfaceColor: "#ffDEE2E6"

  PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    margins.top: 5

    margins.left: 10
    margins.right: 10

    implicitHeight: 40
    color: "transparent"

    FlexboxLayout{
      id: flexLayout

      anchors.fill: parent
      direction: FlexboxLayout.Row
      justifyContent: FlexboxLayout.JustifySpaceBetween
      alignItems: FlexboxLayout.AlignCenter

      ClockTag{
        element_surfaceColor: surfaceColor
        element_textOnSurfaceColor: textOnSurfaceColor
      }

      Rectangle{
        implicitWidth: 400 
        implicitHeight: parent.height
        color: "transparent"
      }

      Rectangle{
        implicitWidth: 400 
        implicitHeight: parent.height
        color: "transparent"

        FlexboxLayout{
          anchors.fill: parent
          width: parent.width
          direction: FlexboxLayout.Row
          justifyContent: FlexboxLayout.JustifyEnd
          alignItems: FlexboxLayout.AlignCenter
          gap: 9 

          AudioTag{
            element_surfaceColor: surfaceColor
            element_textOnSurfaceColor: textOnSurfaceColor
          }
          
          BatteryTag{ 
            element_surfaceColor: surfaceColor
            element_textOnSurfaceColor: textOnSurfaceColor
          }

          NotificationBell{
            element_surfaceColor: surfaceColor
            element_textOnSurfaceColor: textOnSurfaceColor
          }

        }
      }

    }
  }
}

