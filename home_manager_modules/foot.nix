{config, pkgs, ...}:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "RobotoMono Nerd Font:size=14";
      };
    };
  };
}
