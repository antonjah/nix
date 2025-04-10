{ config, pkgs, ... }:
let
  catppuccin = builtins.fetchTarball {
    url = "https://github.com/catppuccin/nix/archive/main.tar.gz";
    sha256 = "1qirfzfn5vvf3l0qccypvanmqmy8qmk5hsykdn7h7jxa45010527";
  };

  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
    sha256 = "0qk1qn04willw5qrzfjs9b7815np8mr6ci68a2787g3q7444bdxp";
  };
in
{
  imports = [
    ("${catppuccin}/modules/nixos")
    ("${home-manager}/nixos")
  ];

  home-manager.users.anton = {
    home.stateVersion = "24.11";

    # Enable catppuccin
    imports = [ "${catppuccin}/modules/home-manager" ];
    catppuccin.flavor = "mocha";
    catppuccin.enable = true;

    # Ghostty
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        font-family = "Cascadia Code PL";
        font-size = 11;
      };
    };

    # Starship
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        cmd_duration = {
          disabled = true;
        };
        line_break = {
          disabled = true;
        };
      };
    };

    # Git
    programs.git = {
      enable = true;
      userName  = "Anton Andersson";
      userEmail = "anton.andersson@protegrity.com";
      aliases = {
        co = "checkout";
      };
    };

    # Zsh
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch";
      };
      initExtra = ''
        bindkey -e
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
      '';
    };

    # Neovim
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        set nu
        set expandtab
        set shiftwidth=4
        set tabstop=4
      '';
      plugins = with pkgs.vimPlugins; [
        lightline-vim
        auto-pairs
      ];
    };
  };
}
