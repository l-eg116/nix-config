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
        libreoffice
        steam
        obsidian
      ];

      home-manager.users.l_eg = {
        desktop = {
          ghostty.enable = true;
          minecraft.enable = true;
        };
      };
    };
}
