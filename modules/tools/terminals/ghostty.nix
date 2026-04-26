{ ... }:
{
  flake.nixosModules.ghostty =
    { ... }:
    {
      home-manager.sharedModules = [
        {
          home.sessionVariables = {
            TERMINAL = "ghostty";
          };

          programs.ghostty = {
            enable = true;
            settings = {
              font-family = "FiraCode Nerd Font Mono";
            };
          };
        }
      ];
    };
}
