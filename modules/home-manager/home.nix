{ inputs, lib, config, pkgs, ...}:

{
  imports = [
    ./apps/chrome.nix
    ./apps/discord.nix
    ./apps/github.nix
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

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}