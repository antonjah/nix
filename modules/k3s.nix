{ config, pkgs, ... }:

{
  services.k3s.enable = true;
  services.k3s.role = "server";
  services.k3s.extraFlags = "--disable traefik";
  networking.firewall.allowedTCPPorts = [ 6443 ];
}
