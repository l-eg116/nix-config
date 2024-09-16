{ inputs, lib, config, pkgs, ...}:

{
  imports = [
    ./apps/arcwtf.nix
    ./apps/chrome.nix
    ./apps/discord.nix
    ./apps/github.nix
    ./apps/kicad.nix
    ./apps/minecraft.nix
    ./apps/obsidian.nix
    ./apps/orca-slicer.nix
    ./apps/signal.nix
    ./apps/vscode.nix
    ./shells/fish.nix
    ./terminal/kitty.nix
  ];

  home = {
    username = "l_eg";
    homeDirectory = "/home/l_eg";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  xdg.enable = true;

  # gtk = {
  #   enable = true;
  #   iconTheme = {
  #     name = "Papirus";
  #     package = pkgs.papirus-icon-theme;
  #   };
  # };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}