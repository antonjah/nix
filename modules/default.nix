{ config, pkgs, ... }:

{
  imports =
    [
      ./home.nix
      ./user.nix
    ];
  
  # Enable zsh
  programs.zsh.enable = true;

  # Enable neovim
  programs.neovim.enable = true;

  # Enable starship
  programs.starship.enable = true;
}
