{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./locale.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
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

  system.stateVersion = "25.11";

  home-manager.users.l_eg = {
    desktop = {
      discord.enable = true;
      github.enable = true;
      ghostty.enable = true;
      kicad.enable = false;
      libreoffice.enable = true;
      minecraft.enable = true;
      obsidian.enable = true;
      orca-slicer.enable = false;
      signal.enable = true;
      vscode.enable = true;
      zen-browser.enable = true;
    };
  };

  desktop = {
    steam.enable = true;
  };

  printing.enable = true;
  docker.enable = true;
  keyboard-tapmod.enable = true;

  # Zen Browser installation while waiting for a proper packages
  environment.systemPackages = [
    # pkgs.rpi-imager
  ];
}
