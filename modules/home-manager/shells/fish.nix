{
  options,
  config,
  lib,
  pkgs,
  ...
}:

let
  aliases = {
    cat = "bat";
    ls = "eza";
    lt = "eza --icons --tree --level 2";
    nano = "micro";
    grep = "rg";
  };
in
{
  home.packages = with pkgs; [
    micro
    neofetch
  ];

  programs.bat = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    silent = true;
    config = {
      global = {
        hide_env_diff = true;
      };
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
  };

  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    commands = {
      on-select = ''
        &{{
          lf -remote "send $id set statfmt \"$(${pkgs.eza}/bin/eza -ld --icons --git -@ --color=always "$f")\""
        }}
      '';
      z = ''
        %{{
          result="$(${pkgs.zoxide}/bin/zoxide query --exclude $PWD $@ | sed 's/\\/\\\\/g;s/"/\\"/g')"
          lf -remote "send $id cd \"$result\""
        }}
      '';
      zi = ''
        ''${{
          result="$(${pkgs.zoxide}/bin/zoxide query -i | sed 's/\\/\\\\/g;s/"/\\"/g')"
          lf -remote "send $id cd \"$result\""
        }}
      '';
      on-cd = ''
        &{{
          ${pkgs.zoxide}/bin/zoxide add "$PWD"
        }}
      '';
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
      '';
      back-to-oldpwd = ''
        %{{
          lf -remote "send $id :cd $OLDPWD; quit"
        }}
      '';
    };

    keybindings = {
      o = "&$OPENER \"$f\"";
      i = "$bat --paging=always $f";

      q = "back-to-oldpwd";
      w = "quit";

      "<space>" = ":toggle";

      md = "mkdir";
    };

    extraConfig =
      let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5

          if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          fi

          ${pkgs.pistol}/bin/pistol "$file"
        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in
      ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
  };
  xdg.configFile."lf/icons".source = ./icons;

  xdg.configFile."neofetch" = {
    source = ./neofetch;
    recursive = true;
  };

  programs.ripgrep.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };
  xdg.configFile."starship.toml".source = ./starship.toml;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.fish = {
    enable = true;
    shellAliases = aliases;
    shellInit = ''
      source $HOME/.config/fish/aliases.fish
    '';
  };
  xdg.configFile."fish" = {
    source = ./fish;
    recursive = true;
  };
}
