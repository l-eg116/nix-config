{ ... }:
{
  flake.nixosModules.libreoffice =
    { pkgs-stable, ... }:
    {
      environment.systemPackages = with pkgs-stable; [
        libreoffice-qt6-fresh
        hunspell
        hunspellDicts.fr-any
        hunspellDicts.en_US-large
        hunspellDicts.en_GB-large
      ];
    };
}
