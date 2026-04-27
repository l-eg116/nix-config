{ ... }:
{
  flake.nixosModules.bat =
    { ... }:
    {
      programs.bat = {
        enable = true;
      };

      environment = {
        shellAliases.cat = "bat";
      };
    };
}
