#!/bin/sh

DEIN_VIM_URL="https://github.com/Shougo/dein.vim.git"
BUNDLE_DIR="$HOME/.vim/bundle"

if [ ! -e $BUNDLE_DIR ]; then
  mkdir -p $BUNDLE_DIR
fi

if [ ! -e $BUNDLE_DIR/dein.vim ]; then
  git clone $DEIN_VIM_URL $BUNDLE_DIR/dein.vim
fi
