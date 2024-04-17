{
  description = "NixOS config flake";

  inputs = {
    # Nix Pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/default/configuration.nix
          ./modules/nixos
          ./modules/home-manager
        ];
      };
    };
  };
}
