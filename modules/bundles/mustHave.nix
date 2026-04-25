{ self, ... }:
{
  flake.nixosModules.bundle-mustHave =
    { ... }:
    {
      imports = with self.nixosModules; [
        # System
        additionalPackages
        networkmanager
        sudo
        user
        # Tools
        git
        nh
      ];
    };
}
