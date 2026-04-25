{ self, ... }:
{

  flake.nixosModules.camille-configuration =
    { ... }:

    {
      networking.hostName = "camille";
      mainUser = "l_eg";

      imports = with self.nixosModules; [
        # Host specific
        camille-hardware
        camille-nvidia
        camille-battery
        # System
        grub
        sudo
        user
        networkmanager
        bluetooth
        defaultLocale
        plasma6
        # Essentials
        bundle-mustHave
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
    };
}
