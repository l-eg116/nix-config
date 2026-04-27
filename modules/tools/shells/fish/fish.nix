{ ... }:
{
  flake.nixosModules.fish =
    { pkgs, ... }:

    {
      programs.fish = {
        enable = true;
        shellAbbrs = {
          # ls & Co.
          ll = "ls -l";
          lla = "ls -la";
          lta = "lt -a";
          llt = "lt -l";
          llta = "lt -la";
          # Nix
          nix-shell = "nix-shell --command fish";
        };
      };
      users.defaultUserShell = pkgs.fish;

      home-manager.sharedModules = [
        {
          home.shell.enableFishIntegration = true;
          xdg.configFile."fish/functions" = {
            source = ./functions;
            recursive = true;
          };
        }
      ];
    };
}
