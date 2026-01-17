{config, pkgs, ...}:
{
  programs.zsh.enable = true;

  # Define user accounts
  users.users.andre = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager" 
      "wheel"
      "dialout"
      "video"
      "input"
    ];
    shell = pkgs.zsh;
  };
}
