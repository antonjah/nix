{ config, pkgs, ... }:

{
  users.users.anton = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Anton Andersson";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ ];
  };
}
