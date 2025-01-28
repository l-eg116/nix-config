{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};
in
{
  options = {
    desktop.kicad.enable = lib.mkEnableOption "Enables KiCad";
  };

  config = lib.mkIf config.desktop.kicad.enable {
    home.packages = with pkgs-stable; [
      kicad
    ];
  };
}
