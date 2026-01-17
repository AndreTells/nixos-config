{config, pkgs, ...}:
{

  nix.settings.experimental-features = [
    "nix-command"
    "flakes" 
  ];

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo"; # Example

  # Enter keyboard layout
  console.keyMap = "dvorak";

  i18n.defaultLocale = "en_US.UTF-8"; # Example

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

}
