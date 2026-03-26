{ pkgs, config, ... }:
{
  programs = {
    fish = {
      enable = true;

      shellAbbrs = {
        ns = "nix-shell";
        cat = "bat -p";
        ls = "eza";
      };

      functions = {
        nos = ''
          sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nix#home
        '';
      };

      interactiveShellInit = ''
        set -g fish_greeting
      '';
    };

    fzf.enableFishIntegration = true;
    yazi.enableFishIntegration = true;
    starship.enableFishIntegration = true;
  };

  home.packages = [
    pkgs.fishPlugins.fzf-fish
  ];
}
