{ self, inputs, ... }: {

  flake.nixosConfigurations.myHostname = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.defaults
      self.nixosModules.myHostname-configuration
    ];
  };
}