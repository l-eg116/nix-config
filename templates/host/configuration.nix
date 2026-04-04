{ self, inputs, ... }:
{

  flake.nixosModules.myHostname-configuration =
    {
      self,
      config,
      pkgs,
      inputs,
      ...
    }:
    {
      imports = [
        self.nixosModules.myHostname-hardware
        self.nixosModules.defaultLocale
      ];
    };
}
