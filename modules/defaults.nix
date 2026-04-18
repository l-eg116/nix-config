{ lib, ... }:
{
  flake.nixosModules.defaults =
    { inputs, ... }:
    {
      options = {
        mainUser = lib.mkOption {
          description = "Global username used across the system.";
          default = "l_eg";
          type = lib.types.str;
        };
      };

      config = {
        # System Version
        system.stateVersion = "25.11";

        # Enable "experimental" features
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

        # Configure nix path
        nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };
    };
}
