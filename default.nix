{ config, pkgs, ... }:

{
  imports = [ ./modules ];

  # nvidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # opengl
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  # bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # hostname
  networking.hostName = "nixos";

  # networking
  networking.networkmanager.enable = true;

  # /etc/hosts
  networking.extraHosts = ''
    127.0.0.1 eclipse.aws.protegrity.com
    127.0.0.1 eclipseaf.aws.protegrity.com
  '';

  # time zone
  time.timeZone = "Europe/Stockholm";

  # internationalisation
  i18n.defaultLocale = "en_US.UTF-8";

  # locale
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # x11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # hyprland
  programs.hyprland.enable = true;

  # gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # disable gnome autosuspend
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  # keyboard
  console.keyMap = "sv-latin1";

  # printing
  services.printing.enable = true;

  # sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # allow unfree
  nixpkgs.config.allowUnfree = true;

  # firefox
  programs.firefox.enable = true;

  # openssh
  services.openssh.enable = true;

  # docker
  virtualisation.docker.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    bash
    git
    vscode
    jetbrains.goland
    teams-for-linux
    fzf
    cascadia-code
    starship
    youtube-music
    tmux
    kubectl
    discord
    go
    openjdk17-bootstrap
    python3
    gradle_7
    gcc11
    kubernetes-helm
    k9s
    tig
    curlie
    jq
    hyprlock
    rofi
    dolphin
    waybar
    unzip
    pavucontrol
    hyprpaper
    hyprcursor
    killall
    gcc11
    cmake
    zed-editor
  ];

  # zsh
  programs.zsh.enable = true;

  # starship
  programs.starship.enable = true;

  # neovim
  programs.neovim.enable = true;

  # dynamic libraries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    gcc11
    glibc
  ];

  # nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # nixos version that was first used (not current one)
  system.stateVersion = "24.11";
}
