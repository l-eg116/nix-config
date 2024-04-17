{ options, config, lib, pkgs, ... }:

let
  aliases = {
    cat = "bat";
    ls = "eza";
    lt = "eza --icons --tree --level 2";
    grep = "rg";
  };
in
{
  home.packages = with pkgs; [
    bat
    eza
    neofetch
    ripgrep
    starship
    zoxide
  ];

  programs.bat.enable = true;

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = true;
  };

  xdg.configFile."neofetch" = {
    source = ./neofetch;
    recursive = true;
  };

  programs.ripgrep.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./starship.toml;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.fish = {
    enable = true;
    shellAliases = aliases;
    shellInit = ''
      source $HOME/.config/fish/aliases.fish
    '';
  };
  xdg.configFile."fish" = {
    source = ./fish;
    recursive = true;
  };
}