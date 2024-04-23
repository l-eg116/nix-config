{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
  ];

  xdg.desktopEntries."vesktop" = {
    name = "Discord";
    genericName = "Internet Messenger";
    exec = "vesktop";
    terminal = false;
    icon = "discord";
    categories = [ "Network" "Utility" ];
  };
}