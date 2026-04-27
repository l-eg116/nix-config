{ ... }:
{
  flake.nixosModules.vscode =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.vscode ];
      environment.shellAliases.c = "code";
    };
}
