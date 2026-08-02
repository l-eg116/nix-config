{ ... }:
{
  flake.nixosModules.sunshine =
    { config, ... }:
    {
      services.sunshine = {
        enable = true;
        autoStart = true;
        capSysAdmin = true;
        openFirewall = true;
      };

      hardware.uinput.enable = true;
      users.groups.uinput.members = [ config.mainUser ];

      # To launch Steam in Big Picture Mode from Sunshine on NixOS, use the following command :
      # capsh --delamb=cap_sys_admin -- -c "setsid steam steam://open/bigpicture"
    };
}
