{ pkgs, ... }:
{
  programs.fish.shellAliases = {
    v = "nvim";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraPackages = with pkgs; [
      pyright
      basedpyright
      lua-language-server
      stylua
      ripgrep
      gopls
      go
      nil
      nixd
      nixfmt
      yaml-language-server
      marksman
      ruff
      wl-clipboard
      gcc
      tree-sitter
      lazygit
    ];
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.lazygit-nvim
      {
        plugin = pkgs.vimPlugins.lazy-nvim;
        type = "lua";
        config = ''
          require("lazy").setup({
            spec = {
              { "LazyVim/LazyVim", import = "lazyvim.plugins" },
              { "mason-org/mason-lspconfig.nvim", enabled = false },
              { "mason-org/mason.nvim", enabled = false },
              {
                "saghen/blink.cmp",
                opts = {
                },
              },
              {
                "neovim/nvim-lspconfig",
                opts = {
                  servers = {
                    nixd = {
                      settings = {
                        nixd = {
                          formatting = {
                            command = { "nixfmt" },
                          },
                        },
                      },
                    },
                  },
                },
              },
            }
          })
        '';
      }
    ];
    initLua = ''
      vim.opt.clipboard = "unnamedplus"
    '';
  };
}
