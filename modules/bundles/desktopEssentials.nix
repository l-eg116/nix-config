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
      ];
    };
}
