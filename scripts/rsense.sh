#!/bin/sh

if [[ -z $(brew ls --versions vim) ]]; then
  brew install vim --with-lua
fi
if [[ -z $(brew ls --versions rsense) ]]; then
  brew install rsense
fi

if [ ! -e $HOME/.rsense ]; then
  eval `brew info rsense | grep ruby`
fi

if [ ! -e $HOME/.vim/plugin  ]; then
  mkdir $HOME/.vim/plugin
fi
if [ ! -e $HOME/.vim/plugin/rsense.vim  ]; then
  version=`brew ls rsense --versions | awk ' { print $2 }'`
  cp /usr/local/Cellar/rsense/$version/libexec/etc/rsense.vim ~/.vim/plugin/
fi

