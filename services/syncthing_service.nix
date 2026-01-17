# stc seems to not connect to syncthing because the config isn't in the correct place 
{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
      syncthing
      stc-cli
  ];

  services.syncthing = {
    enable = true;
    user = "andre";
    dataDir = "/home/andre/Share";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "tablet" = { id = "GPZY6IH-IQ3JTES-OEJ2VL5-YEVNV5P-YTOUDVX-N6GD3WR-CHVVM4E-FHHWVAH"; };
        "redmi"  = { id = "SLT2PML-RUG4JNA-M4RXD2O-LE5NFXS-FPKC4KA-7FQG6ML-HVGSYES-SRBMYQM"; };
        "pixel"  = { id = "V4HC2HI-MWGJ3TK-4N6PX3Q-IXYU4LA-FOPIXMV-ZTMVOZU-32DPS4J-DYX72A2"; };
        "macos"  = { id = "ZJ4PAWK-OXCTVIH-PNHDV7H-M6UJMBO-VI37BTT-G3DIEYR-TQBIEZP-BUK5EAG"; };
      };
      folders = {
        "Share" = {
          path = "~/Share";
          devices = [
            "tablet" 
            "pixel"
            "macos"
          ];
        };
        "Scanner" = {
          path = "~/Scanner";
          devices = [
            "redmi" 
            "pixel"
          ];
        };
        "Music" = {
          path = "~/Music";
          devices = [
            "tablet"
          ];
        };
      };
    };
  };

}
