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
