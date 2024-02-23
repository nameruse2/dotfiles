function domain -d "take a domain and run some basic checks"
    echo "# WHOIS"
    whois $argv[1] | grep -i "registrar:"
    echo "# DIG"
    echo "## A record"
    dig $argv[1] A +short
    dig $argv[1] A +short | xargs whois | grep -i "orgname"
    echo "## AAAA record"
    dig $argv[1] AAAA +short
    echo "## MX record"
    dig $argv[1] MX +short
    echo "## TXT record"
    dig $argv[1] TXT +short
    echo "## CNAME record"
    dig $argv[1] CNAME +short

    echo "# Subdomains"
    subfinder -d $argv[1] -silent | httpx -ip -silent
end
