#!/bin/sh

RUBY="/usr/bin/ruby"
HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

BREW_LIST="$HOME/.dotfiles/brew.list"
MAS_LIST="$HOME/.dotfiles/mas.list"

function install_homebrew() {
  if ! hash brew 2>/dev/null; then
    echo "Homebrew is not installed. Install now..."
    $RUBY -e "$(curl -fsSL $HOMEBREW_URL)"
  else
    echo "Homebrew is already installed."
  fi
}

function install_homebrew_packages() {
  echo "Install homebrew packages"
  for pkg in `cat $BREW_LIST`
  do
    brew install $pkg
  done
}

function install_appstore_applications() {
  echo "Install AppStore applications"
  for app in `cat $MAS_LIST | awk '{ print $1 }'`
  do
    mas install $app
  done
}

install_homebrew
install_homebrew_packages
install_appstore_applications
