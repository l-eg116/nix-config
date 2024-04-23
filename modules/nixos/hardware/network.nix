{ pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    enableStrongSwan = true;
  };
}
