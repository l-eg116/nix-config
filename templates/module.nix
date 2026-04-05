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
      # Contents
    };
}
