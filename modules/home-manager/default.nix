{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."l_eg".imports = [
      ./home.nix
    ];
  };
}