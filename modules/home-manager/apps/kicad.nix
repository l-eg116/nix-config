{ pkgs, ... }:

{
  options = {
    desktop.kicad.enable = lib.mkEnableOption "Enables KiCad";
  };

  config = lib.mkIf config.desktop.kicad.enable {
    home.packages = with pkgs; [
      kicad
    ];
  }
}