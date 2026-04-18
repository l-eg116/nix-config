{ config, lib, ... }:

{
  options = {
    docker.enable = lib.mkEnableOption "Enables Docker service";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;

    users.groups.docker.members = [ config.mainUser ];
  };
}
