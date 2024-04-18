{ pkgs, ... }:

{
  # networking.wireless.enable = true;

  networking.networkmanager = {
    enable = true;
    enableStrongSwan = true;
  };
}
