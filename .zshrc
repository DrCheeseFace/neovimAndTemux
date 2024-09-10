ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#custom sources
alias nvim="/opt/nvim-linux64/bin/nvim"
alias temo="~/.config/bash/temo.sh"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-autosuggestions 
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

#keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory 
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups 
setopt hist_ignore_all_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath'

alias ls='ls --color'
export PATH="$PATH:/mnt/c/Windows/System32"
export PATH="$PATH:/mnt/c/Windows"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

