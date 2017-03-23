#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
MITAMAE_BIN="$HOME/bin/mitamae"
MITAMAE_URL="https://github.com/k0kubun/mitamae/releases/download/v1.4.2/mitamae-x86_64-`uname`"

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
  curl -L $MITAMAE_URL -o $MITAMAE_BIN
  chmod +x $MITAMAE_BIN
fi
$MITAMAE_BIN version

# Clone shiftky/.dotfiles
if [ ! -e $DOTFILES_DIR ]; then
  if "$TRAVIS" = "true"; then
    git clone -b $TRAVIS_BRANCH https://github.com/shiftky/dotfiles.git $DOTFILES_DIR
  else
    git clone https://github.com/shiftky/dotfiles.git $DOTFILES_DIR
  fi
fi
cd $DOTFILES_DIR

# Run mitamae
$MITAMAE_BIN local -y nodes/`uname`.yml entry.rb
