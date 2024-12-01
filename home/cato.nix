{ config, pkgs, ... }:

let
  nushellConfig = import ../config/nushell.nix { pkgs = pkgs; };
  tmuxConfig = import ../config/tmux.nix { pkgs = pkgs; };
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
    ]
      ++ nushellConfig.packages
      ++ tmuxConfig.packages;

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;

    nushell = nushellConfig.program;
    tmux = tmuxConfig.program;
  };
}
