# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Installing plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add powerlevel10k as plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k


# Loading aliases from .bash_aliases file
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# Load plugins after instant prompt initialization
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load zsh-completions
autoload -U compinit && compinit

# HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEFILE=$HISTSIZE


# COMPLETION STYLING
zstyle ':completion:*' matcher-list 'm:{a-Z}={A-Za-z}'
zstyle ':completion:*' list-color "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu-no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Additional console I/O commands should go below this line
alias ls='ls --color'

# FZF initialization
eval "$(fzf --zsh)"



ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins can be found in $ZSH/plugins/
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source /home/skywalker/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

neofetch

source <(fzf --zsh)

