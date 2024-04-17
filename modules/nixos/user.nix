{ config, pkgs, ... }:

{
  users.users.l_eg = {
    isNormalUser = true;
    description = "Émile";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  security.sudo.wheelNeedsPassword = false;
}