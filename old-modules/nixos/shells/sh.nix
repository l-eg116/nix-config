{
  options,
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Must have packages
  environment.systemPackages = with pkgs; [
    unzip
    usbutils
    wget
  ];
}
