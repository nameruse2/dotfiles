function list-functions
    # Description: Lists custom functions and their description
    for filename in (ls -p ~/.config/fish/functions/)
        set description (grep -m 1 "Description:" ~/.config/fish/functions/$filename)
        echo -e "$filename | \e[31m$description\e[0m"
    end
end
