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
        ghostty
        pika-backup
        vscode
        zen-browser
        # Apps
        discord
        signal
      ];
    };
}
