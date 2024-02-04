function ns --description 'Search note files and open in editor'
fd . Documents/notes/ | fzf --height 100% --border --preview 'bat --color=always {}' --bind 'enter:become(hx {})'
end
