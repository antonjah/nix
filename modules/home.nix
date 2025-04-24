{ config, pkgs, ... }:
let
  catppuccin = builtins.fetchTarball {
    url = "https://github.com/catppuccin/nix/archive/main.tar.gz";
    sha256 = "1r7kqsd928c1kiaj6pqynhazvg8s1dvdj5j1zw5hs5p623j8m6yg";
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

    # Enable k9s
    programs.k9s.enable = true;

    # Enable kitty
    programs.kitty = {
      enable = true;
      font.name = "Cascadia Code PL";
      font.size = 12;
      settings = {
        enable_audio_bell = false;
        cursor_shape = "block";
      };
      shellIntegration.enableZshIntegration = true;
      shellIntegration.mode = "no-cursor";
    };

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
        font-size = 12;
        cursor-style = "block";
        cursor-style-blink = false;
        shell-integration-features = "no-cursor";
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
        ns = "nix-shell";
        k = "kubectl";
        gco = "git checkout";
        ecu = "cd ~/src/gitlab/pim/code && gradle pim.esamock:composeUp --parallel -w && cd -";
        ecd = "cd ~/src/gitlab/pim/code && gradle pim.esamock:composeDown -w && cd -";
      };
      initExtra = ''
        bindkey -e
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
      '';
      oh-my-zsh.enable = true;
      oh-my-zsh.plugins = [ "z" ];
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

    # Tmux
    programs.tmux.enable = true;

    # fzf
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
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
        buf = {
          disabled = true;
        };
        c = {
          disabled = true;
        };
        cmake = {
          disabled = true;
        };
        conda = {
          disabled = true;
        };
        crystal = {
          disabled = true;
        };
        dart = {
          disabled = true;
        };
        docker_context = {
          disabled = true;
        };
        elixir = {
          disabled = true;
        };
        elm = {
          disabled = true;
        };
        fennel = {
          disabled = true;
        };
        fossil_branch = {
          disabled = true;
        };
        golang = {
          disabled = true;
        };
        guix_shell = {
          disabled = true;
        };
        helm = {
          disabled = true;
        };
        haskell = {
          disabled = true;
        };
        haxe = {
          disabled = true;
        };
        hg_branch = {
          disabled = true;
        };
        hostname = {
          disabled = true;
        };
        java = {
          disabled = true;
        };
        julia = {
          disabled = true;
        };
        kotlin = {
          disabled = true;
        };
        lua = {
          disabled = true;
        };
        memory_usage = {
          disabled = true;
        };
        meson = {
          disabled = true;
        };
        nim = {
          disabled = true;
        };
        nodejs = {
          disabled = true;
        };
        ocaml = {
          disabled = true;
        };
        perl = {
          disabled = true;
        };
        php = {
          disabled = true;
        };
        python = {
          disabled = true;
        };
        pijul_channel = {
          disabled = true;
        };
        rlang = {
          disabled = true;
        };
        ruby = {
          disabled = true;
        };
        rust = {
          disabled = true;
        };
        scala = {
          disabled = true;
        };
        swift = {
          disabled = true;
        };
        zig = {
          disabled = true;
        };
        gradle = {
          disabled = true;
        };
      };
    };
  };
}
