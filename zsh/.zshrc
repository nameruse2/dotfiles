# source the alias file
source "$XDG_CONFIG_HOME/zsh/aliases"

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# completion
autoload -Uz compinit; compinit
# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)

# prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# directory stack - aliased in alias file
# use 'd' to list. numbers 1-10 to go to specific directory
# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# vi mode
# enable switching between normal and insert with esc key
bindkey -v
export KEYTIMEOUT=1
# visualisation to differentiate between normal and insert  
autoload -Uz cursor_mode && cursor_mode

# fzf
# Append this line to ~/.zshrc to enable fzf keybindings for Zsh:
source /usr/share/doc/fzf/examples/key-bindings.zsh
# Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:
source /usr/share/doc/fzf/examples/completion.zsh


source $DOTFILES/zsh/scripts.sh
source ~/dotfiles/zsh/external/bd.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
