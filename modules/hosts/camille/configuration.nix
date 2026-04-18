{ self, ... }:
{

  flake.nixosModules.camille-configuration =
    { ... }:

    {
      networking.hostName = "camille";

      imports = with self.nixosModules; [
        camille-hardware
        camille-nvidia
        # System
        grub
        plymouth
        networkmanager
        bluetooth
        defaultLocale
        # Essentials
        bundle-desktopEssentials
      ];

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

      docker.enable = true;
      keyboard-tapmod.enable = true;
    };
}
