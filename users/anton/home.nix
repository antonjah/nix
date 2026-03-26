{ pkgs, ... }:
{
  imports = [
    ../../modules/home/niri
    ../../modules/home/bat.nix
    ../../modules/home/firefox.nix
    ../../modules/home/fish.nix
    ../../modules/home/fzf.nix
    ../../modules/home/kitty.nix
    ../../modules/home/lazygit.nix
    ../../modules/home/neovim.nix
    ../../modules/home/qutebrowser.nix
    ../../modules/home/starship.nix
    ../../modules/home/tokyonight.nix
    ../../modules/home/zoxide.nix
  ];

  home.username = "anton";
  home.homeDirectory = "/home/anton";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    xwayland-satellite
    git
    nerd-fonts.jetbrains-mono
    wl-clipboard
    yazi
    udiskie
    nixd
    nil
    nixfmt
    tig
    openssl
    ripgrep
    fd
    eza
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };
}
