{ pkgs, ... }:

{
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
}
