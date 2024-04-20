{ config, pkgs, pkgs-unstable, ... }:

{
  boot.kernelParams = [ "ibt=off" ];

  # Asus and Supergfxctl services
  nixpkgs.overlays = [(final: prev: {
    asusctl = pkgs-unstable.asusctl;
  })];
  services.supergfxd.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  environment.systemPackages = with pkgs; [
     # gnome extensions
     gnomeExtensions.supergfxctl-gex
  ];
}
