{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    desktop.signal.enable = lib.mkEnableOption "Enables Signal.";
  };

  config = lib.mkIf config.desktop.signal.enable {
    home.packages = with pkgs; [
      signal-desktop
    ];
  };
}
