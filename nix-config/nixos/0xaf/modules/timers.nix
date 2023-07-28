{ pkgs, ... }: {

  # Timers and crons
  systemd.timers."home-internal-backup" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "home-internal-backup.service";
    };
  };
  systemd.services."home-internal-backup" = {
    path = [
      pkgs.borgbackup
    ];
    script = ''
      ${pkgs.bash}/bin/bash /home/alizaidi/scripts/layer1-home-borg.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "alizaidi";
    };
  };
}
