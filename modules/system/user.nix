{ ... }:
{
  flake.nixosModules.user =
    { config, ... }:

    {
      users.users.${config.mainUser} = {
        isNormalUser = true;
        description = "Émile";
        extraGroups = [
          "wheel" # Sudo
          "dialout" # Serial devices such as Arduino or Flipper Zero
          "tty" # Serial devices such as Arduino or Flipper Zero
        ];
      };

      home-manager.users.${config.mainUser} = { };
    };
}
