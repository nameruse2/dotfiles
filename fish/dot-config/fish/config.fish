if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf --fish | source
end

set fish_greeting ""
set -gx EDITOR nvim

fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/go/bin
fish_add_path -g /Users/dave/bin/dinner_spinner
fish_add_path -g /Users/dave/Library/Python/3.11/bin
fish_add_path -g /Users/dave/.fzf/bin
fish_add_path -g /Users/dave/.local/bin
fish_add_path -g /usr/local/bin/
fish_add_path -g /Users/dave/bin/

abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr --add notes cd ~/Documents/notes
abbr --add config cd ~/.config/
abbr --add dcu docker compose up -d
abbr --add dcd docker compose down
abbr --add gs git status
abbr --add ga git add .

abbr --add t todo.sh
abbr --add ta todo.sh add (date '+%Y-%m-%d')
abbr --add tl todo.sh ls

zoxide init fish | source

starship init fish | source
enable_transience

# fzf should be populated via `fd` which is the fastest file/dir finder. (respects gitignore, etc)
# note.. `fd` seems faster than `ag`.. but if i wanted to use `ag` this is good: command ag --files-with-matches --filename-pattern ""
# fd > 8.1 got slower. https://github.com/sharkdp/fd/issues/1131
#    so.. here's the install for the last fast one: CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install --vers 8.1.1 fd-find
# To do a fzf including hidden/ignord files.. 'fd --unrestricted'
export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND='fd'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {} 2>/dev/null || tree -C {}'"

# test -f ~/.aliases; and . ~/.aliases

eval "$(/usr/local/bin/brew shellenv)"
