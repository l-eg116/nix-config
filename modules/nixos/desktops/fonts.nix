{ config, pkgs, ... }:

{
  environment.variables = {
    # Enable icons in tooling since we have nerdfonts.
    LOG_ICONS = "true";
  };

  fonts.enableDefaultPackages = false;
  environment.systemPackages = with pkgs; [font-manager];

  fonts.packages = with pkgs; [
    inter
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Inter" ];
      monospace = [ "FiraCode" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
