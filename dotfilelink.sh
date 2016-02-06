#! /bin/bash

cd ~/dotfiles/
git submodule init
git submodule update
cd ~/

ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/_vim ~/.vim

mkdir tmp

