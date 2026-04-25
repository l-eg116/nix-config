{ self, ... }:
{
  flake.nixosModules.bundle-mustHave =
    { ... }:
    {
      imports = with self.nixosModules; [
        # System
        additionalPackages
        # Tools
        git
        nh
      ];
    };
}
