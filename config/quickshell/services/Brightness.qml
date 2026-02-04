pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property var laptop_brightness:0;
  signal brightnessChange

  Process {
      id: brightness_process 
      // the command it will run, every argument is its own string
      command: ["brightnessctl", "g"]

      // run the command immediately
      running: true

      // process the stdout stream using a StdioCollector
      // Use StdioCollector to retrieve the text the process sends
      // to stdout.
      stdout: StdioCollector {
        // Listen for the streamFinished signal, which is sent
        // when the process closes stdout or exits.
        onStreamFinished: () =>{
          var new_brightness = parseInt(this.text) / 96000;
          if(root.laptop_brightness != new_brightness){
            brightnessChange();
          }
          root.laptop_brightness = new_brightness;
        } 
      }
  }

  Timer{
    interval: 100 

    // start the timer immediately
    running: true

    // run the timer again when it ends
    repeat: true

    onTriggered: brightness_process.running = true
  }

}
