{ ... }:
{
  flake.nixosModules.direnv =
    { ... }:
    {
      programs.direnv = {
        enable = true;
        silent = true;
        settings = {
          global = {
            hide_env_diff = true;
          };
        };
      };
    };
}
