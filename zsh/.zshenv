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
export HISTSIZE=10000 # Maximum events for internal history
export SAVEHIST=10000 # Maximum events in history file

export EDITOR="hx"
export VISUAL="hx"

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/zsh/oh-my-zsh"

