{ config, pkgs, ... }:

let
  configDir = "${config.xdg.configHome}";
  nushellDir = "${configDir}/nushell";
in
{
  home = {
    username = "cato";
    homeDirectory = "/home/cato";
    stateVersion = "24.05";

    packages = with pkgs; [
      oh-my-posh

      neovim
      vimPlugins.vim-tmux-navigator

      zellij
      nushell
      carapace

      ripgrep
      fd
      eza
      zoxide
      fzf
      bat
      mdbook

      docker

      gh
      git

      go
      rustup
      lua
      php81
      php81Packages.composer
    ];

    sessionVariables = {
      EDITOR = "nvim";
      NUSHELL_DIR = nushellDir;
    };

    file."${nushellDir}/aliases.nu".source = ../config/nushell/aliases.nu;
  };

  programs = {
    home-manager.enable = true;
    nushell = {
      enable = true;
      configFile.source = ../config/nushell/config.nu;
    };
  };
}
