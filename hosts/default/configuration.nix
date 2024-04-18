{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./locale.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  networking.hostName = "Camille";

  catppuccin.flavour = "mocha";

  system.stateVersion = "23.11";
}
