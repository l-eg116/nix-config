{ config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./shells/sh.nix
    ./tools/kanata.nix
    ./tools/nix-utils.nix
    ./tools/qflipper.nix
    ./tools/steam.nix
  ];

}
