{ config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./user.nix
    ./desktops/fonts.nix
    ./desktops/plasma.nix
    ./hardware/battery.nix
    ./hardware/bluetooth.nix
    ./hardware/network.nix
    ./hardware/sound.nix
    ./hardware/nvidia.nix
    ./shells/sh.nix
    ./system/bootloader.nix
    ./system/print.nix
    ./system/udev.nix
    ./tools/git.nix
    ./tools/nh.nix
    ./tools/qflipper.nix
    ./tools/steam.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
