{ ... }:
{
  flake.nixosModules.networkmanager =
    { config, ... }:

    {
      networking.networkmanager = {
        enable = true;
      };

      users.extraGroups.networkmanager.members = [ config.mainUser ];
    };
}
