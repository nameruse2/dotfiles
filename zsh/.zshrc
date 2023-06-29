# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:$PATH
autoload -U compinit; compinit
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true" #_ and - will be interchangeable.

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13 # set frequency of update checks

ENABLE_CORRECTION="true" # enable command autocorrection

# Which plugins would you like to load?
plugins=(git taskwarrior)

source $ZSH/oh-my-zsh.sh

#fzf
if [[ -e "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
elif [[ -e "/data/data/com.termux/files/usr/share/fzf/key-bindings.zsh" ]]; then
  source /data/data/com.termux/files/usr/share/fzf/key-bindings.zsh
  source /data/data/com.termux/files/usr/share/fzf/completion.zsh
fi

# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias update="sudo apt update; sudo apt upgrade -y; sudo snap refresh; flatpak update -y; omz update"
#alias fd="fdfind"
alias notes-pull="rclone sync mega:notes ~/Documents/notes -P"
alias notes-push="rclone sync ~/Documents/notes mega:notes -P"
alias myip="curl icanhazip.com"

#source ~/dotfiles/zsh/completion.zsh
#source ~/dotfiles/zsh/key-bindings.zsh

