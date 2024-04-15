# Fish implementation of todo.txt

function todo

    set todofile $HOME/documents/notes/todo.txt

    argparse h/help -- $argv
    argparse a/add -- $argv
    argparse l/list -- $argv
    or return

    if set -ql _flag_help
        echo "todo [-h|--help] [-a|--add] [-l|--list] [-@|--contexts] [-+|--projects] [-p|--priorities]"
        echo "Fish implementation of todo.txt."
        echo $todofile
        return 0
    end

    if set -ql _flag_add
        # Do something here to take input and append to file
    end

    if set -ql _flag_list
      bat $todofile --theme Nord
      for i in (cat -n todo.txt | sort --key=2); echo $i; end
    end
    


     
end
