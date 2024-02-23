function bulkdomain
    # Description: Take a file of domains. Run bulk whois and give the registrar for each domain.
    parallel -a $argv[1] 'printf {}; whois {} | grep -m 1 Registrar:'
end
