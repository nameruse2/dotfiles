if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr --add notes ~/Documents/notes
zoxide init fish | source
starship init fish | source

