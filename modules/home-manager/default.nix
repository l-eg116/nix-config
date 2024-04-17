{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "l_eg" = import ./home.nix;
      # "root" = import ./root_home.nix;
    };
  };
}