{ ... }:
{
  flake.nixosModules.pika-backup =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pika-backup
      ];
    };
}
