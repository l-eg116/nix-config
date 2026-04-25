{ ... }:
{
  flake.nixosModules.git =
    { ... }:

    {
      programs.git = {
        enable = true;
        config = {
          init = {
            defaultBranch = "main";
          };
          url = {
            "https://github.com/" = {
              insteadOf = [
                "gh:"
                "github:"
              ];
            };
          };
        };
      };

      # TODO : configure aliases
    };
}
