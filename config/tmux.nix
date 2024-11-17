{ config, pkgs, ... }

{
  programs = {
    tmux = {
      enable = true;
      shortcut = " ";
      escapeTime = 10;
      keyMode = "vi";
      terminal = "tmux-256color";
      histroyLimit = 50000;
    };
  };
}
