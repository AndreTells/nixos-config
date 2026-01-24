{config,pkgs, ...}:
let
  custom_dwl = (pkgs.dwl.override {
    configH = builtins.readFile ./../config/dwl/config.h;  # Adjust path as needed
  }).overrideAttrs( oldAttrs: {
    patches = (oldAttrs.patches or []) ++ [
      ../patches/dwl/movestack.patch
      ../patches/dwl/gaps.patch
      #../patches/dwl/bar.patch
    ];
    buildInputs = (oldAttrs.buildInputs or []) ++ [
      #bar dependencies
      #pkgs.fcft
      #pkgs.pixman
      #pkgs.tllist
      #pkgs.libdrm
    ];
  });
in
{
  environment.systemPackages = with pkgs; [
    custom_dwl
    foot # basic terminal expected by current dwl config (see termcmd in config.h)
    grim # taking screenshots
    slurp # allows one to select a region of the screen in wayland, it's usefull
          # to take screenshots and to share the screen 

    wl-clipboard # system clipboard in wayland
    brightnessctl # screen brightness control interface

    #bar dependencies
    #fcft
    #pixman
    #tllist

    #notification
    #dunst # notification daemon 
    libnotify

    # wayland debugging tools
    wlr-randr
    wayland-utils
  ];

  #allows sandboxed applications to access system resources in a secure manner
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr # dwl is based on wlroots so this is necessary 
    ];
    wlr = {
      enable = true;
      settings = { # uninteresting for this problem, for completeness only
        screencast = {
          max_fps = 30;
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
        };
      };
    };
  };

  environment.etc."dwl_aux_scripts" = {
    enable = true;
    source = ../config/dwl_aux_scripts;
  };
}
