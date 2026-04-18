{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 12d --keep 4";
    };
    flake = "/home/${config.mainUser}/Documents/repos/nix-config";
  };
}
