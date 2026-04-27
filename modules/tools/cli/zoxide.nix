{ ... }:
{
  flake.nixosModules.zoxide =
    { ... }:
    {
      programs.zoxide = {
        enable = true;
        # flags = [ "--no-cmd" ]; # Broken :thinking:
      };
      environment.shellAliases = {
        cd = "__zoxide_z";
        cdi = "__zoxide_zi";
      };
    };
}
