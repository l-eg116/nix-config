{ config, pkgs, inputs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  services.xserver.dpi = 124;

  # Keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Not utils
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.konsole
    kdePackages.elisa
    kdePackages.okular
  ];

  # Utils
  environment.systemPackages = with pkgs; [
    kolourpaint
    kdePackages.filelight
    mission-center
    papirus-icon-theme
    partition-manager
    pika-backup
  ];
  programs.kdeconnect.enable = true;
}
