# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:$PATH
# autoload -U compinit; compinit
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
#ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true" #_ and - will be interchangeable.

zstyle ':omz:update' mode auto  # just remind me to update when it's time
zstyle ':omz:update' frequency 7 # set frequency of update checks

ENABLE_CORRECTION="true" # enable command autocorrection

# Which plugins would you like to load?
plugins=(git ripgrep fd)

source $ZSH/oh-my-zsh.sh

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
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

##########
# MAC SETTINGS
##########
if [[ "$OSTYPE" == "darwin"* ]]; then
  bindkey "ç" fzf-cd-widget
  alias ud="brew update; brew upgrade; omz update"
fi

###########
# Linux Settings
###########
if [[ "$OSTYPE" == "linux"* ]]; then
  alias ud="sudo apt update; sudo apt upgrade -y; sudo snap refresh; flatpak update -y; omz update"
fi

source $HOME/.config/zsh/zsh-aliases

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
