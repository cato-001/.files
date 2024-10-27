{ config, pkgs, ... }:

{
  home.username = "cato";
  home.homeDirectory = "/home/cato";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.tmux
    pkgs.zsh
    pkgs.neovim

    pkgs.ripgrep
    pkgs.fd
    pkgs.eza
    pkgs.zoxide
    pkgs.fzf
    pkgs.bat

    pkgs.gh
    pkgs.git

    pkgs.go
    pkgs.rustup
    pkgs.lua

    pkgs.nerdfonts.override { fonts = [ "FireCode" ];

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

   # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
