function jrnl -d "Add journal entry"

    set jrnlfile ~/Documents/notes/journal.txt
    
    argparse 'h/help' 'a/add' 'p/print' 's/search' 'o/open' -- $argv
    or return

    if set -ql _flag_help
        echo "jrnl [-h|--help] [-a|--add] [Journal entry]"
        echo "Adds a dated journal entry."
        return 0
    end

    if set -ql _flag_add
        set today (date '+[%Y-%m-%d-%a]')
        echo $today $argv >> $jrnlfile
    end

    if set -ql _flag_print
        cat $jrnlfile
    end

    if set -ql _flag_search
        grep -i $argv $jrnlfile
    end

    if set -ql _flag_open
        $EDITOR $jrnlfile
    end
    
end
