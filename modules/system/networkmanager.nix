{ ... }:
{
  flake.nixosModules.networkmanager =
    { ... }:

    {
      networking.networkmanager = {
        enable = true;
      };
    };
}
