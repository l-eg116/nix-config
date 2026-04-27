{ ... }:
{
  flake.nixosModules.ripgrep =
    { pkgs, ... }:
    {
      environment = {
        systemPackages = [ pkgs.ripgrep ];
        shellAliases.grep = "rg";
      };
    };
}
