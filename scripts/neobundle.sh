#!/bin/sh

if [ ! -e $HOME/.vim/bundle ]; then
  mkdir -p $HOME/.vim/bundle
fi

if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi
if [ ! -e $HOME/.vim/bundle/vimproc ]; then
  git clone https://github.com/Shougo/vimproc $HOME/.vim/bundle/vimproc
  cd $HOME/.vim/bundle/vimproc
  make
fi
