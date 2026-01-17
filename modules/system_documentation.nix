{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # Documentation
    man-pages
    man-pages-posix
    man-db
  ];

  documentation = {
    dev.enable = true; # includes documentation targeted at developpers
    man.generateCaches = true; # allows using apropos and -k to search the docs
    nixos.includeAllModules = true; # downloads docs for all options in the
                                    # current nixos derivation
  };
}
