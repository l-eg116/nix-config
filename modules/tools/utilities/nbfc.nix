{ ... }:
{
  flake.nixosModules.nbfc =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      options = {
        nbfcConfigId = lib.mkOption {
          description = "Configuration ID for the nbfc utility. See https://nbfc-linux.github.io/configs/.";
          type = lib.types.str;
        };
      };

      config =
        let
          filename = "nbfc/nbfc.json";
        in
        {

          environment.systemPackages = with pkgs; [
            nbfc-linux
          ];
          systemd.services.nbfc_service = {
            enable = true;
            description = "NoteBook FanControl service";
            serviceConfig.Type = "simple";
            path = [ pkgs.kmod ];

            script = "${pkgs.nbfc-linux}/bin/nbfc_service --config-file '/etc/${filename}'";

            wantedBy = [ "multi-user.target" ];
          };

          environment.etc."${filename}".text = ''
            {"SelectedConfigId": "${config.nbfcConfigId}"}
          '';
        };
    };
}
