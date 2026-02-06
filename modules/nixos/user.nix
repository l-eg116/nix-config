{ pkgs, ... }:

{
  users.users.l_eg = {
    isNormalUser = true;
    description = "Émile";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel" # Sudo
      "dialout" # Serial devices such as Arduino or Flipper Zero
      "tty" # Serial devices such as Arduino or Flipper Zero
      "input"
      "uinput" # For Kanata usage
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}
