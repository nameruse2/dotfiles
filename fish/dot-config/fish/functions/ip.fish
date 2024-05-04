function ip --description 'Take an IP and run some basic checks'
    echo "# WHOIS"
    whois $argv[1]
    echo "# SHODAN"
    shodan host $argv[1]
end
