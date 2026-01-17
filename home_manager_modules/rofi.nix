# Home manager Module
{ config, lib, pkgs, ... }:
let
  # Create a package for your custom theme
  rofi-theme = pkgs.writeText "custom-theme.rasi" (builtins.readFile ../config/rofi/rofi_theme_image.rasi);
in

{
  programs.rofi={
      enable = true;
      extraConfig = {
        matching = "fuzzy";
        show-icons = true;
      };
      package = pkgs.rofi;
      theme = "${rofi-theme}";
    };
  home.packages = with pkgs; [
    rofi-bluetooth
  ];

}
