{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    pass
    gnupg
    pinentry-curses
  ];

  services.gpg-agent= {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  programs.password-store = {
    enable = true;
    settings.PASSWORD_STORE_DIR = "/home/andre/.password-store";
  };

}
