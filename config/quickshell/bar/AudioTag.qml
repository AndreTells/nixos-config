import Quickshell.Services.Pipewire
import Quickshell
import QtQuick

Rectangle{
  required property color element_surfaceColor;
  required property color element_textOnSurfaceColor;

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

  implicitWidth: 100 
  implicitHeight: parent.height * 0.9
  radius: parent.height * 0.8 /2
  color: element_surfaceColor 

  Text {
    anchors.centerIn: parent
    text: {
      const enabled_audio_text = `  ${Math.floor(Pipewire.defaultAudioSink.audio.volume * 100)} %`;
      const muted_audio_text = `󰝟  ${Math.floor(Pipewire.defaultAudioSink.audio.volume * 100)} %`;
      const is_muted = Pipewire.defaultAudioSink.audio.muted;
      return is_muted ? muted_audio_text : enabled_audio_text;
    }
    color: element_textOnSurfaceColor
    font.pixelSize: 16
  }
}
