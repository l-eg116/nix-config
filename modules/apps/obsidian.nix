{ ... }:
{
  flake.nixosModules.obsidian =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        obsidian
      ];
    };
}
