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
      pulse.enable = true;
      alsa.enable = true;
      wireplumber.enable = true;
      # Critical: Enable screen capture modules
      extraConfig = {
        # Add screen capture module
        pipewire = {
          "context.modules" = [
            {
              name = "libpipewire-module-screen-capture";
              args = { };
            }
          ];
        };
      };
    };

  };
  security.rtkit.enable = true;
}
