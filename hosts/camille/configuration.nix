{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./locale.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  networking.hostName = "camille";

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";

    cursor = {
      name = "Posy's Cursor";
      size = 32;
      package = pkgs.stdenvNoCC.mkDerivation {
        name = "posy-improved-cursor";

        src = pkgs.fetchFromGitHub {
          owner = "simtrami";
          repo = "posy-improved-cursor-linux";
          rev = "bd2bac08bf01e25846a6643dd30e2acffa9517d4";
          hash = "sha256-ndxz0KEU18ZKbPK2vTtEWUkOB/KqA362ipJMjVEgzYQ=";
        };

        dontBuild = true;

        installPhase = ''
          mkdir -p $out/share/icons
          mv Posy_Cursor "$out/share/icons/Posy's Cursor"
        '';
      };
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
        name = "FiraCode";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    opacity = {
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
      applications = 0.8;
    };
  };

  system.stateVersion = "24.05";
}
