{ config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./shells/sh.nix
    ./tools/kanata.nix
    ./tools/qflipper.nix
    ./tools/steam.nix
  ];

}
