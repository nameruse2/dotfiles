function bulkdomain
    parallel -a $argv[1] 'printf {}; whois {} | grep -m 1 Registrar:'
end
