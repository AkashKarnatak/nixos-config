{ config, pkgs, ... }:

{
  boot.kernelParams = [ "ibt=off" ];

  # Asus and Supergfxctl services
  services.supergfxd.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  environment.systemPackages = with pkgs; [
     asusctl
     supergfxctl
     # gnome extensions
     gnomeExtensions.supergfxctl-gex
  ];
}
