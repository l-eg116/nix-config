{ self, inputs, ... }:
{

  flake.nixosModules.myHostname-hardware =
    {
      config,
      pkgs,
      inputs,
      ...
    }:
    {
      # Contents of hardware-configuration.nix
    };
}
