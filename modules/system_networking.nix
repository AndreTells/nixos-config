{config, pkgs, ...}:
{

  hardware.bluetooth.enable = true;
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      8384
      22000
      5900
    ];

    allowedUDPPorts = [
      22000
      21027
      5900
    ];

    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };

}
