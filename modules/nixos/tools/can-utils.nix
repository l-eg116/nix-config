{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    can-utils
  ];
}