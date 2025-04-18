{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    keyboard-tapmod.enable = lib.mkEnableOption "Enables turning the CapsLock key into ctrl/esc.";
  };

  config = lib.mkIf config.desktop.steam.enable {
    # Enable the uinput module
    boot.kernelModules = [ "uinput" ];

    # Enable uinput
    hardware.uinput.enable = true;

    # Set up udev rules for uinput
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

    # Ensure the uinput group exists
    users.groups.uinput = { };

    # Add the Kanata service user to necessary groups
    systemd.services.kanata-internalKeyboard.serviceConfig = {
      SupplementaryGroups = [
        "input"
        "uinput"
      ];
    };

    services.kanata = {
      enable = true;
      keyboards = {
        internalKeyboard = {
          devices = [
            # Replace the paths below with the appropriate device paths for your setup.
            # Use `ls /dev/input/by-path/` to find your keyboard devices.
            "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          ];
          extraDefCfg = "process-unmapped-keys yes";
          config = ''
            ;; Caps to escape/control configuration for Kanata

            (defsrc
              caps
            )

            (defalias
              escctrl (tap-hold 100 100 esc lctl)
            )

            (deflayer base
              @escctrl
            )
          '';
        };
      };
    };
  };
}
