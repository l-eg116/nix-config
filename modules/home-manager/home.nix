{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./apps/chrome.nix
    ./apps/discord.nix
    ./apps/github.nix
    ./apps/kicad.nix
    ./apps/libreoffice.nix
    ./apps/minecraft.nix
    ./apps/obsidian.nix
    ./apps/orca-slicer.nix
    ./apps/signal.nix
    ./apps/vscode.nix
    ./apps/zoom-us.nix
    ./shells/fish.nix
    ./terminal/kitty.nix
  ];

  home = {
    username = "l_eg";
    homeDirectory = "/home/l_eg";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  xdg.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
