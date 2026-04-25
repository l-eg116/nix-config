{ ... }:
{
  flake.nixosModules.docker =
    { config, ... }:

    {
      virtualisation.docker.enable = true;

      users.groups.docker.members = [ config.mainUser ];
    };
}
