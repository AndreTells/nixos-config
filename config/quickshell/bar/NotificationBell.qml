import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Quickshell.Services.Notifications
import Quickshell
import QtQuick

Rectangle{
  required property color element_surfaceColor;
  required property color element_textOnSurfaceColor;
  
  property list<Notification> activeNotifications;
  property bool receivedNotification: false 

  Connections {
      target: NotificationServer{
          onNotification:(new_notif)=>{
              receivedNotification = true;
              //handle notification

              new_notif.closed.connect(function(reason) {
                      // use 'fyi' command utility to test this out
                      activeNotifications = activeNotifications.filter(notif=> notif != new_notif);
                      new_notif.dismiss;

                      if(activeNotifications.length == 0){
                        receivedNotification = false;
                      }
                      destroy();
                  });

              const allNotifs = [...activeNotifications];
              for (const notif of allNotifs) {
                  console.log(notif)
                  console.log(notif.id)
                  console.log(notif.summary)
                  console.log(notif.body)
              }

              new_notif.tracked = true;
              activeNotifications.push(new_notif);
          }
      }
  }

  implicitWidth: 50 
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

  /*
   *SystemTray.items.values[0].icon 
  Text {
    anchors.centerIn: parent
    text: SystemTray.items.values[0].status == Status.Active
    color: element_textOnSurfaceColor
    font.pixelSize: 16
  }
  Text {
    anchors.centerIn: parent
    text: { return notificationCount != 0 ? "you got a notification": "no notifications" }
    color: element_textOnSurfaceColor
    font.pixelSize: 16
  }
  */
}
