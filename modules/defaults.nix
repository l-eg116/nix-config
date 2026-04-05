{ ... }:
{
  flake.nixosModules.defaults =
    { ... }:
    {
      # System Version
      system.stateVersion = "25.11";

      # Enable "experimental" features
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;
    };
}
