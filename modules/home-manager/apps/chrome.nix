{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    desktop.chrome.enable = lib.mkEnableOption "Enables Chrome";
  };

  config = lib.mkIf config.desktop.chrome.enable {
    home.packages = with pkgs; [
      google-chrome
    ];

    xdg.mimeApps = {
      enable = false;
      defaultApplications = {
        "text/html" = "google-chrome.desktop";
        "x-scheme-handler/http" = "google-chrome.desktop";
        "x-scheme-handler/https" = "google-chrome.desktop";
      };
    };
  };
}
