{config, pkgs, lib, ...}:
{

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ 
    "nvidia" 
  ];

  hardware = {
    # Enable OpenGL
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # obs: va stands for "video acceleration". Thus the vaapi packages are
        # apis to offload video encoding and decoding from the cpu to the gpu,
        # which is to say, accelearte video 

        intel-vaapi-driver # intel va-api
        libvdpau-va-gl # VDPAU driver with VA-API backend
        nvidia-vaapi-driver       # NVIDIA VA-API
        libva-vdpau-driver # fall back nvidia va api

        # for video encoding/decoding acceleration
        nv-codec-headers
        libva
        libva-utils
      ];
    };

    nvidia = {
      #modesetting.enable = true; 

      prime = {
        sync.enable = false;
        offload.enable = true;
        offload.enableOffloadCmd = true;
        
        # NVIDIA Bus ID from your lspci output: 01:00.0
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";  # Most common
      };

      # use proprietary driver
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # PERFORMANCE OPTIMIZATIONS
      #forceFullCompositionPipeline = false;  # Fix screen tearing
      #nvidiaPersistenced = false;           # Keep GPU initialized (faster app launches)
      videoAcceleration = true;
    };
  };
  boot.blacklistedKernelModules = [ "nouveau" ]; # open-source nvidia driver (?)
  
  # Add these kernel parameters
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];
  
  # System packages
  environment.systemPackages = with pkgs; [
    # NVIDIA tools
    nvidia-vaapi-driver
    mesa-demos 
    vdpauinfo
    
    # VA-API tools
    libva-utils
    
    # Diagnostic tools
    pciutils
    clinfo
  ];

}
