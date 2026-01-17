{ config, pkgs, ... }: 
{
  system.stateVersion = "24.11";
  imports = [
      ./hosts/laptop-configuration.nix
      ./modules/bootloader.nix
      ./modules/nvidia_rtx4060_mobile.nix
      ./modules/system_networking.nix
      ./modules/system_packages.nix
      ./modules/system_settings.nix
      ./modules/system_storage.nix
      ./modules/system_virtualisation.nix
      ./modules/system_fonts.nix
      ./modules/system_documentation.nix
      ./modules/dwl.nix
      ./modules/quickshell.nix
      ./services/generic_services.nix
      ./services/power_management_service.nix
      ./services/security_service.nix
      #./services/syncthing_service.nix
      ./services/docker_service.nix
      ./modules/users.nix
      ./home_manager_users/andre_home_manager.nix
      ./home_manager_users/shared_home_manager.nix
  ];
  
}
