{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  options = {
    desktop.vscode.enable = lib.mkEnableOption {
      description = "Enables VS Code.";
      default = true;
    };
  };

  config = lib.mkIf config.desktop.vscode.enable {
    programs.vscode.enable = true;
  };
}
