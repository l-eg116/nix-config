{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    desktop.kitty.enable = lib.mkEnableOption {
      description = "Enables Kitty.";
      default = false;
    };
  };

  config = lib.mkIf config.desktop.kitty.enable {
    home.sessionVariables = {
      TERMINAL = "kitty";
    };

    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;

      settings = {
        disable_ligatures = "never";

        tab_bar_style = "powerline";
        enabled_layouts = "horizontal, tall, vertical";
        url_style = "dashed";
        show_hyperlink_targets = "yes";
        open_url_with = "default";

        enable_audio_bell = "no";
        close_on_child_death = "yes";
        confirm_os_window_close = -1;
      };
      extraConfig = ''
        map ctrl+shift+enter new_window_with_cwd

        map ctrl+left  neighboring_window left
        map ctrl+right neighboring_window right
        map ctrl+up    neighboring_window top
        map ctrl+down  neighboring_window bottom

        map ctrl+shift+left  move_window left
        map ctrl+shift+right move_window right
        map ctrl+shift+up    move_window top
        map ctrl+shift+down  move_window bottom
      '';
    };
  };
}
