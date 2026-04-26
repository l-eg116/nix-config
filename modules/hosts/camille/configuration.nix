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
        bluetooth
        defaultLocale
        plasma6
        # Bundles
        bundle-mustHave
        bundle-desktopEssentials
        # Tools
        qFlipper
        github
        # Apps
        steam
      ];

      home-manager.users.l_eg = {
        desktop = {
          discord.enable = true;
          ghostty.enable = true;
          kicad.enable = false;
          libreoffice.enable = true;
          minecraft.enable = true;
          obsidian.enable = true;
          signal.enable = true;
        };
      };
    };
}
