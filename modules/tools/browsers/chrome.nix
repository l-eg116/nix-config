{ ... }:
{
  flake.nixosModules.google-chrome =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        google-chrome
      ];
    };
}
