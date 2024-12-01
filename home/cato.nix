{ config, pkgs, ... }:

{
  home = {
    username = "cato";
    homeDirectory = "/home/cato";
    stateVersion = "24.05";

    packages = with pkgs; [
      nushell
      oh-my-posh

      neovim
      vimPlugins.vim-tmux-navigator

      ripgrep
      fd
      eza
      zoxide
      fzf
      bat
      mdbook

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
  };

  programs = {
    home-manager.enable = true;
  };
}
