# for dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# for specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# set editor to neovim (nvim)
export EDITOR="nvim"
export VISUAL="nvim"

# determine where the config files for zsh will be located
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

# add the variable $DOTFILES which is the directory for all of our dotfiles
export DOTFILES="$HOME/dotfiles"


