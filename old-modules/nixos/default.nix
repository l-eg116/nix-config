{ config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./desktops/fonts.nix
    ./desktops/plasma.nix
    ./shells/sh.nix
    ./tools/docker.nix
    ./tools/git.nix
    ./tools/kanata.nix
    ./tools/nix-utils.nix
    ./tools/qflipper.nix
    ./tools/steam.nix
  ];

}
