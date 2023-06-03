#!/bin/bash

# NEOVIM
ln -sf $PWD/nvim/ $HOME/.config

# ZSH
ln -sf $PWD/zsh/.zshrc $HOME/.config/zsh/.zshrc
ln -sf $PWD/zsh/.zshenv $HOME/.zshenv

#EMACS
ln -sf $PWD/.emacs $HOME/.emacs
#TODO move oh my zsh folder if it exists
