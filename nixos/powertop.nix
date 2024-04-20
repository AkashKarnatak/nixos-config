{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     powertop
  ];

  # Powertop systemd service
  systemd.services.powertopTunings = {
    enable = true;
    description = "Powertop tunings";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''${pkgs.bash}/bin/bash -c "${pkgs.powertop}/bin/powertop --auto-tune && echo 'on' > '/sys/bus/usb/devices/1-2/power/control'"'';
    };
  };
}
