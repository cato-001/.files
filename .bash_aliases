# Git
alias gp="git push"
alias gl="git pull"
alias gs="git status"
alias ga="git add --all"
alias gg="git commit -m"

# Ls
alias la="ls -A"
alias ll='ls -alF'
alias l='ls -CF'

# NeoVim
alias v="nvim"
alias vim="nvim"
alias today="nvim +:Today<Cr>GA"
# vi should stay as vi

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
