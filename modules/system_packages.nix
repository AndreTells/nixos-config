{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # Documentation
    man-pages
    man-pages-posix
    man-db

    # Disk Management
    libva-utils
    parted
    alsa-utils

    # Hardware Utils
    pciutils #lspci
    usbutils #lsusb

    # Network Utils
    bind 
    nettools
    nmap

    # Archive Utils
    zip 
    unzip

    # Core Utils
    wget 
    curl
    htop
    git
    vim # basic text editor

    #xdg(cross desktop group) utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };
}
