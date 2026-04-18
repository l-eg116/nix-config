{ self, ... }:
{
  flake.nixosModules.bundle-desktopEssentials =
    { ... }:
    {
      imports = with self.nixosModules; [
        printing
        sound
        udev
      ];
    };
}
