{ config, pkgs, ... }:

{
  home = {
    username = "cato";
    homeDirectory = "/home/cato";
    stateVersion = "24.05";

    packages = with pkgs; [
      tmux
      nushell
      oh-my-posh

      vimPlugins.vim-tmux-navigator
      vimPlugins.neovim-sensible

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

    file = {
      # ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/rc.zsh";
      # ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/p10k.zsh";
      ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/ideavimrc";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
