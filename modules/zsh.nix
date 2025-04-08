{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      vim = "nvim";
    };
  };
}