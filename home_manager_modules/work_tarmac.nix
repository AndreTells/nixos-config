{config, libs, pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;
  # requires running the configure step outlined in the github page
  home.packages = with pkgs; [
    go-passbolt-cli
    slack
    usql
    jq
  ];

  home.shellAliases = {
    agoa = "~/.config/tarmac/agoa.sh";
    agoa_new = "~/.config/tarmac/agoa_new.sh";
    agoa_new_prod = "~/.config/tarmac/agoa_new_prod.sh";
  };

  xdg.configFile."tarmac" = {
    source = ../config/tarmac;
    recursive = true;
  };

}
