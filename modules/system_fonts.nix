{config, pkgs, ...}:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.roboto-mono
      source-code-pro
      source-sans-pro
      source-serif-pro
    ]; 

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "RobotoMono" ];
        sansSerif = [ "FiraCode" ];
        serif     = [ "FiraCode" ];
      };
    };

  };
}
