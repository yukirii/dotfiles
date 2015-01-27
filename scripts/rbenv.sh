#!/bin/sh

RBENV_REPO="https://github.com/sstephenson/rbenv.git"
RUBY_BUILD_REPO="https://github.com/sstephenson/ruby-build.git"

git clone $RBENV_REPO $HOME/.rbenv
git clone $RUBY_BUILD_REPO $HOME/.rbenv/plugins/ruby-build

echo
echo 'Add rbenv settings to your shell settings.\n'
echo '  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"'
echo '  eval "$(rbenv init -)"'
echo
