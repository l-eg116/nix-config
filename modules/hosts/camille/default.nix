{ self, inputs, ... }:
{

  flake.nixosConfigurations.camille = inputs.nixpkgs.lib.nixosSystem {
    specialArgs =
      let
        system = "x86_64-linux";
      in
      {
        inherit inputs;
        pkgs-stable = import inputs.nixpkgs-stable { inherit system; };
      };
    modules = [
      inputs.home-manager.nixosModules.default

      self.nixosModules.defaults
      self.nixosModules.camille-configuration
    ];
  };
}
