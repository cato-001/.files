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
  ];

  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/rc.zsh";
    ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/p10k.zsh";
    ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/ideavimrc";
  };

  programs = {
    zsh = {
      enable = true;

      shellAliases = {
c="cargo";
cr="cargo run --";
cb="cargo build";
ck="cargo check";
ca="cargo add";
ci="cargo install";
cu="cargo update";
cpub="cargo publish";
cn="cargo new";
cini="cargo init";

dc="docker compose";
dcex="docker compose exec";
dcup="docker compose up -d";
dcpup = "docker compose pull; docker compose up -d";

v="nvim-open";
vim="nvim";

whichv ="which $1 | xargs nvim";

py="python3";

alias fb="featurebranches";
alias fbrb="fb-rebuild";
alias fbup="fb-up";
alias fbrm="fb-rm";
fbdns="fb dns-status | rg $1 --color never | rg $2 --color never";
fbst = "fb status | rg \"$1|Host|\+|\| Featurebranch\" --color never";

redis="docker compose exec redis redis-cli";

alias j="z";

ls="eza";
ll="eza -l";
la="eza -lag";

lf="fd . -t f";

cat="bat";
      };

      promptInit = ''
        eval "$(oh-my-posh init zsh)"
        eval "$(zoxide init zsh)"
      '';
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
