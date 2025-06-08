{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    desktop.obsidian.enable = lib.mkEnableOption "Enables Obsidian.";
  };

  config = lib.mkIf config.desktop.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
