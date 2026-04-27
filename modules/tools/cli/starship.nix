{ ... }:
{
  flake.nixosModules.starship =
    { ... }:
    {
      programs.starship = {
        enable = true;
        settings = fromTOML (builtins.readFile ./starship.toml);
        transientPrompt = {
          enable = true;
          left = ''
            starship module username
            starship module character
          '';
          right = ''
            starship module directory
            starship module time
          '';
        };
      };
    };
}
