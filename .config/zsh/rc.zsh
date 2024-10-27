# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup Environment
GOBIN="$HOME/.local/bin"

# Setup the PATH
export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.krew/bin"
export PATH="$PATH:$HOME/.local/bin"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/zinit/zinit.git"

# Download Zinit, if it not exists
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice depth=1; zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load prompt completions
autoload -U compinit && compinit

zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:j:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybinds
bindkey -v
bindkey '^f' autosuggest-accept

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Test for WSL
if [[ -d /mnt/c/Windows ]]; then
  if [[ -f "/usr/local/bin/startup" ]]; then
    /mnt/c/Windows/system32/wsl.exe -d ${WSL_DISTRO_NAME} -u root /usr/local/bin/startup
  fi

  export DISPLAY=host.docker.internal:0.0 #GWSL
  export PULSE_SERVER=tcp:host.docker.internal #GWSL
  export LIBGL_ALWAYS_INDIRECT=1 #GWSL
  export LD_LIBRARY_PATH=/usr/local/lib
fi

# Load aliases
source ~/.config/zsh/aliases.zsh
