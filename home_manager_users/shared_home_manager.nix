{config, pkgs, ...}:
{
  imports = [
    <home-manager/nixos>
  ]; 

  home-manager.sharedModules = [
    ../home_manager_modules/password_storage.nix
    ../home_manager_modules/zsh.nix
    ../home_manager_modules/git.nix
    ../home_manager_modules/rofi.nix
    ../home_manager_modules/foot.nix
    ../home_manager_modules/nvim.nix
    ../home_manager_modules/work_tarmac.nix
  ];
}
