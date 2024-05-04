function ns --description 'Search note files and open in editor'
    # Description: Search note files by filename and open in editor
    fd . -t f ~/Documents/notes/ | fzf --height 100% --border --preview 'bat --color=always {}' --bind 'enter:become(hx {})' --delimiter / --with-nth -1
    # fd . ~/Documents/notes/ | fzf --height 100% --border --preview 'bat --color=always {}' --bind 'enter:become(hx {})'
end
