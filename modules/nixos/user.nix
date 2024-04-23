{ config, pkgs, ... }:

{
  users.users.l_eg = {
    isNormalUser = true;
    description = "Émile";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel" # Sudo
      "dialout" # Serial devices such as Arduino or Flipper Zero
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}