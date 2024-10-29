{ config, pkgs, ... }:

{
  home.username = "cato";
  home.homeDirectory = "/home/cato";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.tmux
    pkgs.zsh
    pkgs.neovim
    pkgs.oh-my-posh

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
    pkgs.php81
    pkgs.php81Packages.composer

    # pkgs.nerdfonts.override { fonts = [ "FireCode" ]; }

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
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/rc.zsh";
    ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/p10k.zsh";
    ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/ideavimrc";
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
