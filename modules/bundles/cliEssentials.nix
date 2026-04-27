{ self, ... }:
{
  flake.nixosModules.bundle-cliEssentials =
    { ... }:
    {
      imports = with self.nixosModules; [
        # Tools
        bat
        direnv
        eza
        lf
        micro
        ripgrep
        starship
        zoxide
      ];
    };
}
