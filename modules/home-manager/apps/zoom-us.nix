{ pkgs, lib, config, ... }:

{
  options = {
    desktop.zoom-us.enable = lib.mkEnableOption "Enables Zoom Workspace";
  };

  config = lib.mkIf config.desktop.zoom-us.enable {
    home.packages = with pkgs; [
      zoom-us
    ];
  };
}