{ self, inputs, ... }:
{

  flake.nixosConfigurations.myHostname = inputs.nixpkgs.lib.nixosSystem {
    specialArgs =
      let
        system = "TODO";
      in
      {
        inherit inputs;
        pkgs-stable = import inputs.nixpkgs-stable { inherit system; };
      };
    modules = [
      self.nixosModules.defaults
      self.nixosModules.myHostname-configuration
    ];
  };
}
