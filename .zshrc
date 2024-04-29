export ZSH="$HOME/.oh-my-zsh"

# setup theme
ZSH_THEME="robbyrussell"

# setup sensitive autocompletion
HYPHEN_INSENSITIVE="true"
# CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="%F{purple}waiting...%f"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  docker-compose
  direnv
  git
  npm
  nvm
  ssh-agent
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

CURRENT_UPTIME="$(uptime -s)"

# Test for WSL
if [[ -d .work.env.mark ]]
then
  if ! grep -Fxqs $CURRENT_UPTIME /var/run/uptime-on-last-startup-script-run
  then
    /mnt/c/Windows/system32/wsl.exe -d ${WSL_DISTRO_NAME} -u root /usr/local/bin/startup
  fi

  export DISPLAY=host.docker.internal:0.0 #GWSL
  export PULSE_SERVER=tcp:host.docker.internal #GWSL
  export LIBGL_ALWAYS_INDIRECT=1 #GWSL
  export LD_LIBRARY_PATH=/usr/local/lib
fi

export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.krew/bin:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# setup nvim
alias v="nvim-open"
alias vim="nvim"

# setup scatternotes
alias sn="scatternotes"

n() {
  scatternotes search $1 | xargs nvim
}

# setup python
alias py="python3"

# setup traveltrex
alias fb="featurebranches"

fb-dns() {
  fb dns-status | rg mongodb42 | rg $1 | xargs -i echo "{}"
}

fb-st() {
  fb status | rg "$1|Host|\+|\| Featurebranch" | xargs -i echo "{}"
}

# setup file aliases
alias -s txt=nvim
alias -s py=nvim
alias -s go=nvim
alias -s json=nvim
alias -s xml=nvim
alias -s php=PhpStorm

# setup zoxide
eval "$(zoxide init zsh)"
alias j="z"

# setup eza
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"

# setup fd-find
alias lf="fd . -t f"

# setup bat
alias cat="bat"

