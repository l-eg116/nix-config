{ pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher-qt5
  ];

  xdg.desktopEntries."org.prismlauncher.PrismLauncher" = {
    name = "Minecraft";
    genericName = "Sandbox Building Game";
    exec = "prismlauncher %U";
    terminal = false;
    icon = "minecraft";
    categories = [ "Application" "Game" "Education" ];
  };
}
