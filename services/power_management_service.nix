{config, pkgs,lib, ...}:
{
  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  services = {
    tlp = {
      enable = true;
      settings = {
        # Battery Care 
        START_CHARGE_THRESH_BAT0=40;
        STOP_CHARGE_THRESH_BAT0=80;
        
        # CPU settings
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        
        # PCIe power saving
        PCIE_ASPM_ON_AC = "performance";
        PCIE_ASPM_ON_BAT = "powersave";
    
        # Disk power saving
        DISK_APM_LEVEL_ON_AC = "254 254";
        DISK_APM_LEVEL_ON_BAT = "128 128";
        DISK_SPINDOWN_TIMEOUT_ON_AC = "0 0";
        DISK_SPINDOWN_TIMEOUT_ON_BAT = "10 10";
    
        # Runtime power management
        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";
    
        # USB autosuspend
        USB_AUTOSUSPEND = 1;
      };
    };


    thermald.enable = true; # premptively deal with heat in intel cpus
    upower.enable = true; # reports power information to applications
  };

  powerManagement = {
    enable = true;
    powertop.enable = true; # tool to look at power stats 
  };

}
