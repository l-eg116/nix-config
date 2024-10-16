{ config, pkgs, ... }:

{
  # Numlock on start
  services.displayManager.sddm.autoNumlock = true;
}
