export ZSH="$HOME/.oh-my-zsh"

# setup theme
# ZSH_THEME="robbyrussell"

# setup sensitive autocompletion
HYPHEN_INSENSITIVE="true"
# CASE_SENSITIVE="true"

# COMPLETION_WAITING_DOTS="%F{purple}waiting...%f"

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

CURRENT_UPTIME="$(uptime -s)"

# Test for WSL
if [[ -f .wsl ]]
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

if [[ -d /mnt/c ]]
then
  export PATH="$PATH:/mnt/c/Program\\ Files/Mozilla\\ Firefox/"
fi

export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.krew/bin:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

source ~/.zsh_aliases

eval "$(starship init zsh)"
