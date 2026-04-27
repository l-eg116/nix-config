{ ... }:
{
  flake.nixosModules.micro =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = [ pkgs.micro ];
        shellAliases.nano = "micro";
      };
    };
}
