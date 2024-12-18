{ pkgs, lib, config, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};
in
{
  options = {
    desktop.orca-slicer.enable = lib.mkEnableOption "Enables Orca Slicer";
  };

  config = lib.mkIf config.desktop.orca-slicer.enable {
    home.packages = with pkgs-stable; [
      orca-slicer
    ];
  };
}