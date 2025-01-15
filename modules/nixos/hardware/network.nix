{ pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    enableStrongSwan = true;
  };

  environment.systemPackages = with pkgs; [
    linux-wifi-hotspot
  ];
}
