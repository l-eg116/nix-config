{ pkgs, lib, config, ... }:

{
  options = {
    desktop.steam.enable = lib.mkEnableOption "Enables Steam";
  };

  config = lib.mkIf config.desktop.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
    ];

    programs.gamemode.enable = true;
  };
}
