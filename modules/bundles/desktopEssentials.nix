{ self, ... }:
{
  flake.nixosModules.bundle-desktopEssentials =
    { ... }:
    {
      imports = with self.nixosModules; [
        # System
        fonts
        plymouth
        printing
        sound
        udev
        # Tools
        pika-backup
        vscode
        zen-browser
      ];
    };
}
