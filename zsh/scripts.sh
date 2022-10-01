#!/bin/zsh


compress() {
tar cvzf $1.tar.gz $1
}

cheat() {
    curl cheat.sh/$1
}

duckduckgo() {
    lynx -vikeys -accept_all_cookies "https://lite.duckduckgo.com/lite/?q=$@"
}


