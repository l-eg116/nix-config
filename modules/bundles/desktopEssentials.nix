{ self, ... }:
{
  flake.nixosModules.bundle-desktopEssentials =
    { ... }:
    {
      imports = [
        self.nixosModules.printing
      ];
    };
}
