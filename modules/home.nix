{ pkgs, ... }:
let
  # manage catppuccin
  catppuccin = builtins.fetchTarball {
    url = "https://github.com/catppuccin/nix/archive/main.tar.gz";
    sha256 = "1dq55kk1scv2h48zagkapm2wk02pvdwm6wyrph6qpn7v01s7lwv8";
  };

  # manage home-manager (inception)
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    sha256 = "1k9rnxmjv9k6wam3iqn3wi4fk8si1g6ml3gff9k041na8cykhp8v";
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

    # set $PATH
    home.sessionPath = [
      "/home/anton/.cargo/bin"
      "/home/anton/go/bin"
      "/home/anton/Scripts"
    ];

    # lazygit
    programs.lazygit = {
      enable = true;
    };

    # zed
    programs.zed-editor = {
      enable = true;
      extraPackages = with pkgs; [
        nixd
        nil
        nixfmt-rfc-style
      ];
      extensions = [
        "Catppuccin Icons"
        "nix"
        "Helm"
      ];
      userKeymaps = [
        {
          context = "Editor";
          bindings = {
            "ctrl-shift-alt-p" = "editor::Format";
            "f10" = "debugger::Start";
            "f6" = "debugger::StepOver";
            "f5" = "debugger::StepInto";
            "f8" = "debugger::StepOut";
          };
        }
      ];
      userSettings = {
        show_edit_predictions = false;
        buffer_font_family = "Cascadia Code";
        format_on_save = "off";
        languages = {
          Nix = {
            language_servers = [
              "nil"
              "!nixd"
            ];
            formatter = {
              external = {
                command = "nixfmt";
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
          fractional_scaling = 1;
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
        ecu = "cd ~/src/gitlab/pimold/code && gradle pim.esamock:composeUp --parallel -w && cd -";
        ecd = "cd ~/src/gitlab/pimold/code && gradle pim.esamock:composeDown -w && cd -";
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

    # btop
    programs.btop.enable = true;

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
        aws = {
          disabled = true;
        };
        gradle = {
          disabled = true;
        };
        kubernetes = {
          disabled = true;
        };
      };
    };
  };
}
