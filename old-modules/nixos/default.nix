{ config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./shells/sh.nix
    ./tools/steam.nix
  ];

}
