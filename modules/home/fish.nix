{ pkgs, config, ... }:
{
  programs = {
    fish = {
      enable = true;

      shellAbbrs = {
        ns = "nix-shell";
        cat = "bat -p";
        nos = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nix#home";
        ls = "eza";
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
