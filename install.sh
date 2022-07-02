#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
MITAMAE_BIN="$HOME/bin/mitamae"
MITAMAE_VERSION="v1.10.0"
MITAMAE_URL_BASE="https://github.com/itamae-kitchen/mitamae/releases/download/$MITAMAE_VERSION"

if [ `uname` = 'Darwin' ]; then
  if [ `uname -m` = 'arm64' ]; then
    MITAMAE_URL="$MITAMAE_URL_BASE/mitamae-aarch64-Darwin"
  else
    MITAMAE_URL="$MITAMAE_URL_BASE/mitamae-x86_64-Darwin"
  fi

  # Install homebrew
  which brew > /dev/null
  if [ "$?" -ne 0 ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
else
  MITAMAE_URL="$MITAMAE_URL_BASE/mitamae-x86_64-`uname`"
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

# Clone yukirii/.dotfiles
if [ ! -e $DOTFILES_DIR ]; then
  if "$TRAVIS" = "true"; then
    git clone -b $TRAVIS_BRANCH https://github.com/yukirii/dotfiles.git $DOTFILES_DIR
  else
    git clone https://github.com/yukirii/dotfiles.git $DOTFILES_DIR
  fi
fi
cd $DOTFILES_DIR

# Run mitamae
$MITAMAE_BIN local -y nodes/`uname`.yml entry.rb
