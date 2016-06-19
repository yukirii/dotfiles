#!/bin/sh

RUBY="/usr/bin/ruby"
HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
BREW_LIST="$HOME/.dotfiles/brew.list"

if ! hash brew 2>/dev/null; then
  echo "Homebrew is not installed. Install now..."
  $RUBY -e "$(curl -fsSL $HOMEBREW_URL)"
else
  echo "Homebrew is already installed."
fi

echo "Install homebrew packages"
for pkg in `cat $BREW_LIST`
do
  brew install $pkg
done
