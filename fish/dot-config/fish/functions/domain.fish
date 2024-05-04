function domain -d "take a domain and run some basic checks"
    echo "# WHOIS"
    whois $argv[1]
    echo "# DIG"
    dog $argv[1] A AAAA CAA CNAME HINFO LOC MX NS PTR SOA SRV SSHFP TLSA TXT

    shodan host (dig $argv[1] A +short)
    echo "# Subdomains"
    subfinder -d $argv[1] -silent
end
