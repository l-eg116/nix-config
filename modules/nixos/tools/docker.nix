{ config, lib, ... }:

{
  options = {
    docker.enable = lib.mkEnableOption "Enables Docker service";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;

    users.extraGroups.docker.members = [ "l_eg" ];
  };
}