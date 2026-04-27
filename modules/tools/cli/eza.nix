{ ... }:
{
  flake.nixosModules.eza =
    { ... }:
    {
      home-manager.sharedModules = [
        {
          programs.eza = {
            enable = true;
            colors = "auto";
            icons = "auto";
          };
        }
      ];
      environment.shellAliases = {
        ls = "eza";
        lt = "eza --icons --tree --level 2";
      };
    };
}
