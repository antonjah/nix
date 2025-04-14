{ config, pkgs, ... }:

{
  imports = [ ./modules ];

  # Nvidia
  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;
  hardware.nvidia.package =
    config.boot.kernelPackages.nvidiaPackages.legacy_470;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # Set hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Set locale
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Disable auto-suspend
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable printing
  services.printing.enable = true;

  # Enable sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable firefox
  programs.firefox.enable = true;

  # Enable OpenSSH
  services.openssh.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Packages
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
    nixfmt-classic
    discord
    go
    openjdk17-bootstrap
    python3
    gradle_7
    gcc11
  ];

  # Dynamic libs
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ zlib gcc11 glibc ];

  # Enable command and flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set NixOS version
  system.stateVersion = "24.11";
}
