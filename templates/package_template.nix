{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  options = {
    desktop.package.enable = lib.mkEnableOption {
      description = "Enables Package.";
      default = false;
    };
  };

  config = lib.mkIf config.desktop.package.enable {
    home.packages = with pkgs; [
      emptyFile
    ];
  };
}
