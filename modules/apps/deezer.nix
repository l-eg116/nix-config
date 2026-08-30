{ ... }:
{
  flake.nixosModules.deezer =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.deezer-desktop ];
    };
}
