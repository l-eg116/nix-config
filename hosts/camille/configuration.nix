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
    automatic = false;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;

  networking.hostName = "camille";

  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";

    # Switched by hand to better match base16 conventions, see result in etc/stylix/palette
    override = {
      base08 = "ea665f"; # Red
      base09 = "df731e"; # Orange
      base0A = "ae8e25"; # Yellow
      base0B = "859a3b"; # Green
      base0C = "559e93"; # Cyan
      base0D = "6577ac"; # Blue
      base0E = "7454a1"; # Purple
      base0F = "6e5934"; # Brown
    };

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
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.inter-nerdfont;
        name = "Inter Variable";
      };
      serif = {
        package = pkgs.inter-nerdfont;
        name = "Inter Variable";
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

  system.stateVersion = "24.11";

  home-manager.users.l_eg = {
    desktop = {
      obsidian.enable = true;
      orca-slicer.enable = true;
      kicad.enable = true;
      libreoffice.enable = true;
      zoom-us.enable = true;
    };
  };

  desktop = {
      steam.enable = true;
  };

  printing.enable = true;
  docker.enable = true;

  # Zen Browser installation while waiting for a proper packages
  environment.systemPackages = [
    inputs.zen-browser.packages."x86_64-linux".default
    pkgs.mongodb-compass
    pkgs.arduino-ide
  ];

  # services.flatpak.enable = true;
}
