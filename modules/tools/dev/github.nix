{ self, ... }:
{
  flake.nixosModules.github =
    { pkgs, ... }:
    {
      imports = [ self.nixosModules.git ];

      config = {
        environment.systemPackages = with pkgs; [
          gh
          github-desktop
        ];

        programs.git = {
          config = {
            user = {
              name = "l-eg116";
              email = "legcom6@gmail.com";
            };
          };
        };
      };
    };
}
