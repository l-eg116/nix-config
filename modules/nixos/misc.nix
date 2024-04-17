{ config, pkgs, ... }:

{
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Numlock on start
  services.displayManager.sddm.autoNumlock = true;
}
