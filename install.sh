#!/bin/zsh

function make_symlink() {
  for file in ~/.dotfiles/conf/* ; do
    if [ -f $file ]; then
      ln -s $file ~/.${file##*/}
    fi
  done
}

function install_powerline() {
  if [ ! -e ~/.dotfiles/powerline ]; then
    mkdir ~/.dotfiles/powerline
  fi

  if [ ! -e ~/.dotfiles/powerline/tmux-powerline ]; then
    git clone https://github.com/erikw/tmux-powerline.git ~/.dotfiles/powerline/tmux-powerline
  fi
  rm -f ~/.dotfiles/powerline/tmux-powerline/themes/default.sh
  ln -s ~/.dotfiles/powerline_conf/tmux-powerline/themes/default.sh ~/.dotfiles/powerline/tmux-powerline/themes/default.sh
}

if [ ! -e ~/.dotfiles ]; then
  cp -r . ~/.dotfiles
fi
make_symlink
install_powerline
