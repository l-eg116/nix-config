{ ... }:
{
  flake.nixosModules.kicad =
    { pkgs-stable, ... }:
    {
      environment.systemPackages = with pkgs-stable; [
        kicad
      ];
    };
}
