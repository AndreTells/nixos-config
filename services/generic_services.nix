{config, pkgs, ...}:
{
  services = {
    dbus.enable = true;
    #tumbler.enable = false;
    timesyncd.enable = true;
    fwupd.enable = true; # firmware updater

    # sound services
    pipewire = {
      enable = true;
      alsa.enable = true;
    };

  };
}
