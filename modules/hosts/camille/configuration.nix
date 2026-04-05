{ self, ... }:
{

  flake.nixosModules.camille-configuration =
    { ... }:

    {
      imports = [
        self.nixosModules.camille-hardware
        self.nixosModules.defaultLocale
      ];

      networking.hostName = "camille";

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
    };
}
