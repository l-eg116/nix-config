{ ... }:
{
  flake.nixosModules.signal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        signal-desktop
      ];
    };
}
