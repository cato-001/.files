{ config, pkgs, ... }:

{
  home = {
    username = "cato";
    homeDirectory = "/home/cato";
    stateVersion = "24.05";

    packages = with pkgs; [
      tmux
      zsh
      neovim
      oh-my-posh

      ripgrep
      fd
      eza
      zoxide
      fzf
      bat

      gh
      git

      go
      rustup
      lua
      php81
      php81Packages.composer
    ];

    file = {
      ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/rc.zsh";
      ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/zsh/p10k.zsh";
      ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/.config/ideavimrc";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
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

        fb="featurebranches";
        fbrb="fb-rebuild";
        fbup="fb-up";
        fbrm="fb-rm";
        fbdns="fb dns-status | rg $1 --color never | rg $2 --color never";
        fbst = "fb status | rg \"$1|Host|\+|\| Featurebranch\" --color never";

        redis="docker compose exec redis redis-cli";

        j="z";

        ls="eza";
        ll="eza -l";
        la="eza -lag";

        lf="fd . -t f";

        cat="bat";
      };
    };
    home-manager.enable = true;
  };
}
