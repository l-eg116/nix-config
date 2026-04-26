{ self, inputs, ... }:
{
  flake.nixosModules.myModule =
    {
      self,
      config,
      pkgs,
      inputs,
      ...
    }:
    {
      home-manager.sharedModules = [
        {
          # Contents
        }
      ];
    };
}
