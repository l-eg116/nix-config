{ ... }:
{
  flake.nixosModules.printing =
    { pkgs, ... }:

    {
      services.printing = {
        enable = true;
        drivers = with pkgs; [
          cups-filters
          cups-browsed
          gutenprint
          # Canon printers drivers
          cnijfilter2
          cnijfilter_2_80
          cnijfilter_4_00
        ];
      };

      # USB auto-discovery
      services.ipp-usb.enable = true;
      # Network auto-discovery
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
}
