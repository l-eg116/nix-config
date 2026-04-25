{ ... }:
{
  flake.nixosModules.bluetooth =
    { ... }:

    {
      # Enable Bluetooth
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
          General = {
            Experimental = true;
          };
        };
      };
    };
}
