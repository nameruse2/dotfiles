function update -d "update brew, fish, and mac app store"
    # Description: Update packages and fish completions
    echo 'start updating ...'

    echo 'updating homebrew'
    brew update
    brew upgrade
    brew cleanup

    echo 'updating fish shell'
    fish_update_completions
end
