{ pkgs, lib, config, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};
in
{
  options = {
    desktop.libreoffice.enable = lib.mkEnableOption "Enables Libre Office";
  };

  config = lib.mkIf config.desktop.libreoffice.enable {
    home.packages = with pkgs-stable; [
      libreoffice-qt6-fresh
      hunspell
      hunspellDicts.fr-any
      hunspellDicts.en_US-large
      hunspellDicts.en_GB-large
    ];
  };
}