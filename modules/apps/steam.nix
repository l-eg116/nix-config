{ ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:

    {
      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
      };

      environment.systemPackages = with pkgs; [
        mangohud
      ];

      programs.gamemode.enable = true;
    };
}
