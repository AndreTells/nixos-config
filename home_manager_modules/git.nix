{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings = {
      init = {
	defaultBranch = "main";
      };
      user = {
	name = "AndreTells";
	email = "andresilvatelles@gmail.com";
      };
    };
  };
}
