{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./shells/fish.nix
  ];

  home = {
    username = "root";
    homeDirectory = "/root";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
