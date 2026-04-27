{ ... }:
{
  flake.nixosModules.vscode =
    { ... }:
    {
      programs.vscode.enable = true;
      environment.shellAliases.c = "code";
    };
}
