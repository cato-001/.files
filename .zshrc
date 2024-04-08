export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  autojump
  docker-compose
  common-aliases
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
if [[ -d /mnt/c/Windows ]]; then
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

alias v="nvim"
alias vim="nvim"
alias today="nvim +Today"
alias py="python3"

alias fb="featurebranches"

alias -s txt=nvim
alias -s py=nvim
alias -s go=nvim
alias -s json=nvim
alias -s xml=nvim
alias -s php=PhpStorm

fb-dns() {
  fb dns-status | rg mongodb42 | rg $1
}

