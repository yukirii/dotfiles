#!/bin/sh

DEIN_VIM_URL="https://github.com/Shougo/dein.vim.git"
BUNDLE_DIR="$HOME/.vim/bundle"

if [ ! -e $BUNDLE_DIR ]; then
  mkdir -p $BUNDLE_DIR
fi

if [ ! -e $BUNDLE_DIR/dein.vim ]; then
  git clone $DEIN_VIM_URL $BUNDLE_DIR/dein.vim
fi

#if [ ! -e $HOME/.vim/bundle/vimproc ]; then
#  git clone https://github.com/Shougo/vimproc $HOME/.vim/bundle/vimproc
#  cd $HOME/.vim/bundle/vimproc
#  make
#fi
