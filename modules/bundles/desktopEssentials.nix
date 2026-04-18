{ self, ... }:
{
  flake.nixosModules.bundle-desktopEssentials =
    { ... }:
    {
      imports = with self.nixosModules; [
        fonts
        plymouth
        printing
        sound
        udev
      ];
    };
}
