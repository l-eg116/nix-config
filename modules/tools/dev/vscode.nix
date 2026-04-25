{ ... }:
{
  flake.nixosModules.vscode =
    { ... }:
    {
      programs.vscode.enable = true;
    };
}
