{ ... }:
{
  flake.nixosModules.additionalPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # Nix related
        nixd
        nixfmt
        # Common utils
        unzip
        wget
      ];
    };
}
