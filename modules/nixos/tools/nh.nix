{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nh
  ];

  programs.nh = {
    enable = true;
    flake = "/home/l_eg/Documents/repos/nix-config";
  };
}