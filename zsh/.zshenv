# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For specific data
export XDG_DATA_HOME="$HOME/.local/share"
# For cached files
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zsh_history"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000


# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
