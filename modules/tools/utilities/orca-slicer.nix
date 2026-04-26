{ ... }:
{
  flake.nixosModules.orca-slicer =
    { pkgs-stable, ... }:

    {
      environment.systemPackages = with pkgs-stable; [
        orca-slicer
      ];
    };
}
