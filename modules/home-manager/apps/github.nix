{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    github-desktop
  ];

  programs.git = {
    enable = true;
    ignores = [ ".vscode" ];

    userName = "l-eg116";
    userEmail = "legcom6@gmail.com";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/x-github-client" = "github-desktop.desktop";
      "x-scheme-handler/x-github-desktop-auth" = "github-desktop.desktop";
    };
  };
}