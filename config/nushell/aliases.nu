alias g = git
alias gc = git commit
alias gst = git status
alias gl = git pull
alias gp = git push
alias gco = git checkout
def gaa [] {
    git add --all
    git status
}

alias c = cargo
alias cr = cargo run --
alias cb = cargo build
alias ck = cargo check
alias ca = cargo add
alias ci = cargo install
alias cu = cargo update
alias cpub = cargo publish
alias cn = cargo new
alias cini = cargo init

alias dc = docker compose
alias dcex = docker compose exec
alias dcup = docker compose up -d
alias dcs = docker compose stop
def dcpup [] {
    docker compose pull
    docker compose up -d
}

alias v = nvim-open
alias vim = nvim
alias today = nvim +Today

alias py = python3

alias fb = featurebranches
alias fbrb = fb-rebuild
alias fbup = fb-up
alias fbrm = fb-rm

alias redis = docker compose exec redis redis-cli

alias j = z

alias ls = eza
alias ll = eza -l
alias la = eza -lag

alias lf = fd . -t f
