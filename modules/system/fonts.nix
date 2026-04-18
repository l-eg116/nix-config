{ ... }:
{
  flake.nixosModules.fonts =
    { pkgs, ... }:

    {
      environment.variables = {
        # Enable icons in tooling since we have nerdfonts.
        LOG_ICONS = "true";
      };

      fonts.enableDefaultPackages = false; # TODO Why not ?
      environment.systemPackages = with pkgs; [ font-manager ];

      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        inter
        noto-fonts-color-emoji
      ];
    };
}
