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

zoxide init fish | source
# starship init fish | source

