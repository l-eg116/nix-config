{ self, inputs, ... }:
{

  flake.nixosConfigurations.camille = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.defaults
      self.nixosModules.camille-configuration

      # For compatibility with old pattern - TODO: switch to dendritic
      inputs.home-manager.nixosModules.default
      ./../../../old-modules/nixos
      ./../../../old-modules/home-manager
    ];
  };
}
