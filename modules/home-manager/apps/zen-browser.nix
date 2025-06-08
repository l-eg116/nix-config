{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  options = {
    desktop.zen-browser.enable = lib.mkEnableOption {
      description = "Enables Zen Browser.";
      default = true;
    };
  };

  config = lib.mkIf config.desktop.zen-browser.enable {
    home.packages = [
      inputs.zen-browser.packages."x86_64-linux".default
    ];
  };
}
