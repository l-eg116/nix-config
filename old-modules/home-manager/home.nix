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
    ./terminal/ghostty.nix
    ./terminal/kitty.nix
  ];

  config = {
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
    home.stateVersion = "25.11";
  };
}
