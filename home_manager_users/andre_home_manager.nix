{config, pkgs, home-manager, ...}:
{
  imports = [
    <home-manager/nixos>
   ]; 

  home-manager.users.andre = {pkgs, ...}: {
    home.packages = with pkgs; [
      libreoffice # basic office apps 

      # file manager
      xfce.thunar

      #browsers
      firefox
        qutebrowser

      # misc. tools
      neofetch
      #screen
      #github-cli
      lsd

      pipe-viewer
      vlc # video player

      tldr # basic usage of commands
      bc # basic calculator
      ripgrep # basically grep but better
      tectonic # compiler for tex documents
      fd # replacement for find command 
      cmus # command line audio player
    ];

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
      ];
    };

    home.shellAliases = {
      duck = "sr -browser=w3m duckduckgo";
      #ai = "llama-cli -m ~/Ai/bin/DeepSeek-R1-Distill-Llama-8B-Q2_K_L.gguf 2>/dev/null";
      ls = "lsd";
      cat = "bat";
      man = "batman";
      nix-shell = "nix-shell --run zsh";
    };


    home.username = "andre";
    home.homeDirectory = "/home/andre";
    home.stateVersion = "25.11";
  };
}
