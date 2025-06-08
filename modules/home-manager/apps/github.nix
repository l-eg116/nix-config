{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    desktop.github.enable = lib.mkEnableOption "Enables GitHub.";
  };

  config = lib.mkIf config.desktop.github.enable {
    home.packages = with pkgs; [
      gh
      github-desktop
    ];

    programs.git = {
      enable = true;
      userName = "l-eg116";
      userEmail = "legcom6@gmail.com";
    };

    xdg.mimeApps = {
      enable = false;
      defaultApplications = {
        "x-scheme-handler/x-github-client" = "github-desktop.desktop";
        "x-scheme-handler/x-github-desktop-auth" = "github-desktop.desktop";
      };
    };
  };
}
