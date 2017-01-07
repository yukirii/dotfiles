#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
MITAMAE_BIN="$HOME/bin/mitamae"
MITAMAE_URL="https://github.com/k0kubun/mitamae/releases/download/v1.3.2/mitamae-i386-`uname`"

if [ `uname` = 'Darwin' ]; then
  # Install homebrew
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

# Clone shiftky/.dotfiles
if [ ! -e $DOTFILES_DIR ]; then
  git clone https://github.com/shiftky/dotfiles.git $DOTFILES_DIR
fi
cd $DOTFILES_DIR

# Run mitamae
$MITAMAE_BIN local -y nodes/`uname`.yml entry.rb
