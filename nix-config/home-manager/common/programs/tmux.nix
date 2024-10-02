{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    prefix = "C-a";
    extraConfig =
      ''
        set -g default-terminal "screen-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        bind r source-file ~/.tmux.conf
        set-option -sg escape-time 10
        set-option -g focus-events on
        set -g status-style ""
        set-option -g status-position bottom
        set -g status-right ""
      '';
  };
}
