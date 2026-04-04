{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  options = {
    desktop.ghostty.enable = lib.mkEnableOption {
      description = "Enables Ghostty.";
      default = true;
    };
  };

  config = lib.mkIf config.desktop.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        font-family = "FiraCode Nerd Font Mono";
      };
    };
  };
}
