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
      imports = with self.nixosModules; [
        myHostname-hardware
        defaultLocale
      ];
    };
}
