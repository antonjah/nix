{ config, pkgs, ... }:
let
  # manage catppuccin
  catppuccin = builtins.fetchTarball {
    url = "https://github.com/catppuccin/nix/archive/main.tar.gz";
    sha256 = "0k82cja6f0fsinid2k5rc6kk1kp3hnrs59309cj6gyjxkyzmdzxs";
  };

  # manage home-manager (inception)
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    sha256 = "11pqy782p1g3h2fwswf3xiwafs6c70igj253jzyvdbaj5i50x86s";
  };
in
{
  imports = [
    "${catppuccin}/modules/nixos"
    "${home-manager}/nixos"
  ];

  home-manager.users.anton = {
    # set the state version that was first used
    home.stateVersion = "24.11";

    # set packages
    home.packages = [
      pkgs.nixfmt-rfc-style
      pkgs.nixd
    ];

    # set $PATH
    home.sessionPath = [
      "/home/anton/.cargo/bin"
      "/home/anton/go/bin"
    ];

    # zed
    programs.zed-editor = {
      enable = true;
      extensions = [ "nix" ];
      userSettings = {
        show_edit_predictions = "off";
        format_on_save = "off";
        languages = {
          "Nix" = {
            formatter = {
              external = {
                command = "nixfmt";
                arguments = [
                  "--quiet"
                  "--"
                ];
              };
            };
          };
        };
      };
    };

    # enable k9s
    programs.k9s.enable = true;

    # rofi
    programs.rofi = {
      enable = true;
      theme = "rounded-purple-dark";
    };

    # waybar
    programs.waybar = {
      enable = false;
      settings = {
        mainBar = {
          reload-style-on-change = true;
          layer = "top";
          position = "top";
          height = 20;
          output = [ "DP-2" ];
          modules-left = [
            "hyprland/workspaces"
            "hyprland/mode"
          ];
          modules-center = [ "clock" ];
          modules-right = [ ];
        };
      };
    };

    # hyprlock
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
        };
        input-field = [ { monitor = "DP-2, 2560x1080@144, 0x0, 1"; } ];
      };
    };

    # kitty
    programs.kitty = {
      enable = true;
      font.name = "Cascadia Code PL";
      font.size = 12;
      settings = {
        enable_audio_bell = false;
        cursor_shape = "block";
        window_padding_width = 20;
      };
      shellIntegration.enableZshIntegration = true;
      shellIntegration.mode = "no-cursor";
    };

    # catppuccin
    imports = [ "${catppuccin}/modules/home-manager" ];
    catppuccin.flavor = "mocha";
    catppuccin.enable = true;
    catppuccin.rofi.enable = false;

    # ghostty
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

    # git
    programs.git = {
      enable = true;
      userName = "Anton Andersson";
      userEmail = "anton.andersson@protegrity.com";
      aliases = {
        co = "checkout";
      };
      extraConfig = {
        pull.rebase = true;
      };
    };

    # zsh
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch";
        ns = "nix-shell";
        k = "kubectl";
        curl = "curlie";
        gco = "git checkout";
        ecu = "cd ~/src/gitlab/pim/code && gradle pim.esamock:composeUp --parallel -w && cd -";
        ecd = "cd ~/src/gitlab/pim/code && gradle pim.esamock:composeDown -w && cd -";
      };
      initContent = ''
        bindkey -e
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
      '';
      oh-my-zsh.enable = true;
      oh-my-zsh.plugins = [ "z" ];
    };

    # neovim
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
        inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
        inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
        inoremap <silent><expr> <c-space> coc#refresh()
      '';
      coc.enable = true;
      plugins = with pkgs.vimPlugins; [
        nerdtree
        coc-go
        vim-go
        auto-pairs
        nvim-treesitter
        nvim-treesitter.withAllGrammars
        {
          plugin = lualine-nvim;
          type = "lua";
          config = ''
            local function metals_status()
              return vim.g["metals_status"] or ""
            end
            require('lualine').setup(
              {
                options = { theme = 'catppuccin' },
                sections = {
                  lualine_a = { 'mode' },
                  lualine_b = { 'branch', 'diff' },
                  lualine_c = { 'filename', metals_status },
                  lualine_x = {'encoding', 'filetype'},
                  lualine_y = {'progress'},
                  lualine_z = {'location'}
                }
              }
            )
          '';
        }
      ];
    };

    # tmux
    programs.tmux.enable = true;

    # fzf
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };

    # starship
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
