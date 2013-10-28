#!/bin/zsh

function make_symlink() {
  if [ -e ~/.dotfiles/conf/$1 ]; then
    ln -s ~/.dotfiles/conf/$1 ~/.$1
  fi
}

cp -r ../dotfiles ~/.dotfiles

make_symlink pryrc
make_symlink zshrc
make_symlink tmux.conf
make_symlink vimrc
make_symlink vimperatorrc
