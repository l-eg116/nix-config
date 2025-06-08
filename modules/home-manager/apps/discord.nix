{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    desktop.discord.enable = lib.mkEnableOption {
      description = "Enables Discord.";
      default = true;
    };
  };

  config = lib.mkIf config.desktop.discord.enable {
    home.packages = with pkgs; [
      (discord.override {
        withVencord = true;
      })
    ];
  };
}
