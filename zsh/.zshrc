
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:$PATH

# autoload -U compinit; compinit
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7 

ENABLE_CORRECTION="true" # enable command autocorrection
HYPHEN_INSENSITIVE="true" #_ and - will be interchangeable.

# Which plugins would you like to load?
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

##########
# FZF
##########
if [[ -e "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
elif [[ -e "/data/data/com.termux/files/usr/share/fzf/key-bindings.zsh" ]]; then
  source /data/data/com.termux/files/usr/share/fzf/key-bindings.zsh
  source /data/data/com.termux/files/usr/share/fzf/completion.zsh
fi

[[ -f ~/.fzf.zsh ]] && source "$HOME/.fzf.zsh"

# This may work for everything?
# eval "$(fzf --zsh)"

##########
# MAC SETTINGS
##########
if [[ "$OSTYPE" == "darwin"* ]]; then
  bindkey "ç" fzf-cd-widget
  alias ud="brew update; brew upgrade; brew cleanup; omz update"
fi

###########
# Linux Settings
###########
if [[ "$OSTYPE" == "linux"* ]]; then
  alias ud="sudo apt update; sudo apt upgrade -y; sudo snap refresh; flatpak update -y; omz update"
fi

source "$HOME/.config/zsh/zsh-aliases"
eval "$(starship init zsh)"

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
