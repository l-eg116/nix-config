{ config, pkgs, inputs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  services.xserver.dpi = 124;

  # Keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Not utils
  environment.plasma5.excludePackages = with pkgs; [
    libsForQt5.konsole
    libsForQt5.elisa
    libsForQt5.okular
  ];

  # Utils
  environment.systemPackages = with pkgs; [
    kdeconnect
    kolourpaint
    libsForQt5.filelight
    mission-center
    papirus-icon-theme
    partition-manager
    pika-backup
  ];
}
