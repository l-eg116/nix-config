{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."l_eg".imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
      ./home.nix
    ];
  };
}