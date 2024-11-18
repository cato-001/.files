# cargo
alias c="cargo"
alias cr="cargo run --"
alias cb="cargo build"
alias ck="cargo check"
alias ca="cargo add"
alias ci="cargo install"
alias cu="cargo update"
alias cpub="cargo publish"
alias cn="cargo new"
alias cini="cargo init"

# setup docker
alias dc="docker compose"
alias dcex="docker compose exec"
alias dcup="docker compose up -d"
dcpup() {
  docker compose pull
  docker compose up -d
}

# setup nvim
alias v="nvim-open"
alias vim="nvim"

whichv() {
  which $1 | xargs nvim
}

# setup ttrace
tt() {
  ttrace --interactive today | bat
}
ty() {
  ttrace --interactive yesterday | bat
}

td() {
  ttrace --interactive day $1 | bat
}
tw() {
  ttrace --interactive week $1 | bat
}

ts() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | xargs ttrace --interactive start
}
tsb() {
  git rev-parse --abbrev-ref HEAD | xargs ts
}

alias tp="ttrace stop"
alias trn="ttrace rename"
alias trs="ttrace restart"

# setup scatternotes
alias sn="scatternotes"

n() {
  scatternotes search $1 | xargs nvim
}

# setup python
alias py="python3"

# setup traveltrex
alias fb="featurebranches"
alias fbrb="fb-rebuild"
alias fbup="fb-up"
alias fbrm="fb-rm"

fbdns() {
  fb dns-status | rg $1 --color never | rg $2 --color never
}

fbst() {
  fb status | rg "$1|Host|\+|\| Featurebranch" | xargs -i echo "{}"
}

gtags() {
  curl -Ls "https://registry.k8s.traveltrex.local/v2/$1/tags/list"
}

alias redis="docker compose exec redis redis-cli"

# setup zoxide
eval "$(zoxide init zsh)"
alias j="z"

# setup eza
alias ls="eza"
alias ll="eza -l"
alias la="eza -lag"

# setup fd-find
alias lf="fd . -t f"

# setup bat
alias cat="bat"

# setup php-storm
phps() {
  tmux new-session -s "phpstorm" -d "PhpStorm"
}

# setup tmux
tmh() {
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s home -c ~
    exit 0
  fi

  if ! tmux has-session -t=home 2> /dev/null; then
    tmux new-session -ds home -c ~
  fi

  tmux switch-client -t home
}
