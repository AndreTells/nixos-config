import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Quickshell.Services.Notifications
import Quickshell
import QtQuick

LazyLoader {
  required property color element_surfaceColor;
  required property color element_textOnSurfaceColor;

  enum NotificationBarState {
    NoNotification = 0,
    HasNotification = 1,
    ShowingNotification = 2
  }

  property NotificationBarState barState: NotificationBarState.NoNotification
  property string barText: ""

  function changeBarState(newState) {
    barState = newState
    if(newState == NotificationBarState.ShowingNotification){
      hideTimer.reset()
    }
  }

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: changeBarState(NotificationBarState.NoNotification)
	}

  active: (barState == NotficationBarState.ShowingNotification)

  Rectangle{
    property list<Notification> activeNotifications;
    property bool receivedNotification: false 

    Connections {
        target: NotificationServer{
            onNotification:(n)=>{
                receivedNotification = true;
                n.tracked = true;
                activeNotifications.push(n);
            }
        }
    }

    implicitWidth: 200
    implicitHeight: parent.height * 0.9
    radius: parent.height * 0.8 /2
    color: element_surfaceColor 

    MouseArea {
      anchors.fill: parent
      onClicked: (event) => {
        receivedNotification = false
      }
    }

    IconImage {
      implicitSize: 20
      anchors.centerIn: parent
      source: {return  receivedNotification ?  "file:/etc/assets/bell-solid-full.png" : "file:/etc/assets/bell-regular-full.png"}
    }

  }
}
