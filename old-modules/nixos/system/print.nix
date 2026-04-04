{ config, lib, ... }:

{
  options = {
    printing.enable = lib.mkEnableOption "Enables printing services";
  };

  config = lib.mkIf config.printing.enable {
    services.printing.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
