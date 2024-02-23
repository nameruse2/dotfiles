# Fish implementation of todo.txt

function todo

    argparse h/help -- $argv
    argparse a/add -- $argv
    or return

    if set -ql _flag_help
        echo "todo [-h|--help]"
        echo "Fish implementation of todo.txt."
        return 0
    end

    if set -ql _flag_add
        # Do something here to take input and append to file
    end

    


     
end
