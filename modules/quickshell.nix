{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    quickshell
  ];

  environment.etc."quickshell" = {
    enable = true;
    source = ../config/quickshell;
  };

  environment.etc."assets" = {
    enable = true;
    source = ../assets;
  };
}
