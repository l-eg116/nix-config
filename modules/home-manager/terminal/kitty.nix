{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    kitty-themes
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    catppuccin.enable = true;
    settings = {
      font_size = 14;
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
}