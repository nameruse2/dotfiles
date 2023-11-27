#!/bin/bash

##########
# Install key software
##########
software=(fd fzf git go neovim parallel powerlevel10k python@3.11 ripgrep tmux wget)

[[ $OSTYPE =~ ^darwin.* ]] && for i in ${software[@]}
do
  brew install "$i"
done 

[[ $OSTYPE =~ ^linux-android ]] && for i in ${software[@]}
do
  pkg install -y "$i"
done 

##########
# NEOVIM Setup
##########
ln -sf $PWD/nvim/ $HOME/.config

##########
# ZSH
##########
ln -sf $PWD/zsh/.zshrc $HOME/.config/zsh/.zshrc
ln -sf $PWD/zsh/.zshenv $HOME/.zshenv

##########
#EMACS
##########
ln -sf $PWD/.emacs $HOME/.emacs
#TODO move oh my zsh folder if it exists
