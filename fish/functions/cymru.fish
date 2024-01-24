function cymru -d "take a list of IP's. Run them through team Cymru's lookup"
    argparse h/help -- $argv
    or return

    if set -ql _flag_help
        echo "cymru [-h|--help] [list of IP addresses]"
        echo "Takes a list of IP addresses and runs them through team cymrus bulk lookup."
        return 0
    end
    
# test if begin and end are in file
    if test (head -n 1 $argv[1]) != "begin"
        echo -e "begin\n$(cat $argv[1])" > $argv[1]
    end

    if test (tail -n 1 $argv[1]) != "end"
        echo "end" >> $argv[1]
    end
    
    netcat whois.cymru.com 43 < "$argv[1]" | sort -n
end
