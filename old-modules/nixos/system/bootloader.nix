{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      default = "saved";
      configurationLimit = 4;
    };
    timeout = 10;
  };

  boot.plymouth = {
    enable = true;
  };
}
