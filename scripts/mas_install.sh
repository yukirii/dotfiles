#!/bin/sh

MAS_LIST="$HOME/.dotfiles/mas.list"

echo "Install AppStore applications"
for app in `cat $MAS_LIST | awk '{ print $1 }'`
do
  mas install $app
done
