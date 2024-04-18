{ config, pkgs, inputs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver.dpi = 124;

  # Keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Not utils
  environment.plasma5.excludePackages = [
    pkgs.libsForQt5.konsole
    pkgs.libsForQt5.elisa
  ];

  # Utils
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    partition-manager
    pika-backup
  ];
}
