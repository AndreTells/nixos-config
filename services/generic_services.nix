{config, pkgs, ...}:
{
  services = {
    dbus.enable = true;
    #tumbler.enable = false;
    timesyncd.enable = true;
    fwupd.enable = true; # firmware updater

    # sound services
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
    };

  };
}
