function init_nix_shell --description="Initialize a directory with a shell.nix and .envrc"
    if [ -e shell.nix ]
        echo "File 'shell.nix' already exists"
    else
        echo "Creating default 'shell.nix'..."
        echo "\
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = \"nix_shell\";

  packages = with pkgs; [
    
  ];

  shellHook = ''
  '';
}" > shell.nix
    end

    echo "Opening shell.nix..."
    micro shell.nix +7:5

    echo "Setting .envrc"
    if test ! -e .envrc || ! command cat .envrc | string match -q "use nix"
        echo "use nix" >> .envrc
    end
end
