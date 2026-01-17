{config, pkgs, ...}:
{
  security.polkit.enable = true;
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    gnupg # privacy guard suite of programs
  ];
}
