{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 12d --keep 4";
    };
    flake = "/home/l_eg/Documents/repos/nix-config";
  };
}
