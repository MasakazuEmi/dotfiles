#! /bin/bash

cd ~/dotfiles/
git submodule init
git submodule update
cd ~/

rm -f ~/.vimrc
ln -s ~/dotfiles/_vimrc ~/.vimrc
rm -f ~/.gvimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
rm -f ~/.vim
ln -s ~/dotfiles/_vim ~/.vim

rm -f ~/.gitconfig
ln -s ~/dotfiles/_gitconfig .gitconfig

mkdir -p tmp 2>/dev/null

