function ip
    whois $argv[1]
    shodan host $argv[1]
end
