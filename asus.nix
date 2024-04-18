{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  boot.kernelParams = [ "ibt=off" ];

  # Asus and Supergfxctl services
  nixpkgs.overlays = [(final: prev: {
    asusctl = unstable.asusctl;
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
