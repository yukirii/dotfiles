#!/usr/bin/env bash

MITAMAE_BIN="$HOME/bin/mitamae"
MITAMAE_URL="https://github.com/k0kubun/mitamae/releases/download/v1.3.2/mitamae-i386-`uname`"

# Install homebrew
if [ `uname` = 'Darwin' ]; then
  which brew > /dev/null
  if [ "$?" -ne 0 ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

# Install mitamae
if [ ! -e $HOME/bin ]; then
  mkdir $HOME/bin
fi
if [ ! -e $MITAMAE_BIN ]; then
  wget $MITAMAE_URL -O $MITAMAE_BIN
  chmod +x $MITAMAE_BIN
fi
$MITAMAE_BIN version

# Run mitamae
cd $HOME/.dotfiles
$MITAMAE_BIN local -y nodes/`uname`.yml entry.rb
