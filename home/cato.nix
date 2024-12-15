{ config, pkgs, ... }:

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
    };

    file = {
      "${config.xdg.configHome}/nushell/aliases.nu".source = config.lib.file.mkOutOfStoreSymlink ../config/nushell/aliases.nu;
      "${config.xdg.configHome}/nushell/zoxide.nu".source = config.lib.file.mkOutOfStoreSymlink ../config/nushell/zoxide.nu;

      "${config.home.homeDirectory}/.hushlogin".text = "";
    };
  };

  programs = {
    home-manager.enable = true;

    nushell = {
      enable = true;
      configFile.source = ../config/nushell/config.nu;
      envFile.source = ../config/nushell/env.nu;
    };

    zellij = {
      enable = true;
    };
  };
}
