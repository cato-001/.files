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

    fzf = {
      enable = true;
      defaultOptions = [
        "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
        "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
        "--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
        "--color=selected-bg:#45475a"
        "--multi"
      ];
    };
  };
}
