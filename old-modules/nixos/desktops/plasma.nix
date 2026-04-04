{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.xserver.dpi = 124;

  # Keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Not utils
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    elisa
    okular
  ];

  # Utils
  environment.systemPackages = with pkgs; [
    kdePackages.kolourpaint
    kdePackages.filelight
    kdePackages.isoimagewriter
    papirus-icon-theme
    pika-backup
  ];
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;
}
