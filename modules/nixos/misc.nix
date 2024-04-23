{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Numlock on start
  services.displayManager.sddm.autoNumlock = true;
}
