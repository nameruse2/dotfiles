if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
# starship init fish | source

