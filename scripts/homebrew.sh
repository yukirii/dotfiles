#!/bin/sh

ruby="/usr/bin/ruby"
homebrew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed."
else
  $ruby -e "$(curl -fsSL $homebrew_url)"
fi
