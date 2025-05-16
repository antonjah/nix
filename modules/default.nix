{ config, pkgs, ... }:

{
  imports = [
    ./home.nix
    ./user.nix
    ./k3s.nix
  ];
}
