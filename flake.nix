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

    # Stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      camille = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
          ./hosts/camille/configuration.nix
          ./modules/nixos
          ./modules/home-manager
        ];
      };
    };
  };
}
