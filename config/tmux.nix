{ pkgs, ... }:

{
  packages = with pkgs; [
    tmux
  ];
  program = {
    enable = true;
    shortcut = "Space";
    escapeTime = 0;
    keyMode = "vi";
    terminal = "tmux-256color";
    historyLimit = 50000;
    clock24 = true;
    baseIndex = 1;
    aggressiveResize = true;
    shell = builtins.toString pkgs.nushell;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank

      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      tmuxPlugins.catppuccin
    ];

    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g @catppuccin_flavour 'mocha'

      # remove defaults
      unbind-key n
      unbind-key p

      # setup scrolling
      set -g mouse on

      # setup alerts
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      set -g bell-action none
      setw -g monitor-activity off
      set -g focus-events on

      # setup windows
      bind - split-window -h -c "#{pane_current_path}"
      bind _ split-window -v -c "#{pane_current_path}"

      bind -n M-h previous-window
      bind -n M-l next-window

      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      bind q kill-window

      # setup status bar
      set -g status-position top
      set -g status-bg "#cba6f7"
      set -g status-fg "#313244"

      set -g pane-border-style fg="#000000"
      set -g pane-active-border-style fg="#000000"

      set -g pane-border-status top
      set -g pane-border-format ' '

      # vi selecting
      bind v "copy-mode \; send-keys 0"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # setup quick commands
      bind-key -r o run-shell "tmux neww ~/.local/bin/nvim-open"

      bind-key -r p run-shell "tmux neww ~/.local/bin/tmux-sessionizer"
      bind-key -r n run-shell "~/.local/bin/tmux-sessionizer scatter"

      set -g status-left-length 50

      bind l next-layout
      bind h previous-layout
    '';
  };
}
