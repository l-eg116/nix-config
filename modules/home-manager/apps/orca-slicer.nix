{ pkgs, lib, config, ... }:

{
  options = {
    desktop.orca-slicer.enable = lib.mkEnableOption "Enables Orca Slicer";
  };

  config = lib.mkIf config.desktop.orca-slicer.enable {
    home.packages = with pkgs; [
      orca-slicer
    ];
  };
}