#! /bin/bash

cd ~/dotfiles/
git submodule init
git submodule update
cd ~/

rm ~/.vimrc
ln -s ~/dotfiles/_vimrc ~/.vimrc
rm ~/.gvimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
rm ~/.vim
ln -s ~/dotfiles/_vim ~/.vim

rm ~/.gitconfig
ln -s ~/dotfiles/_gitconfig .gitconfig

mkdir -p tmp 2>/dev/null

