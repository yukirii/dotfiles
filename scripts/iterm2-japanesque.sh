#!/bin/sh

FILENAME="Japanesque.itermcolors"
TEMPDIR="$HOME/.dotfiles/tmp"

# http://this.aereal.org/entry/2013/01/02/222304
URL="https://raw.githubusercontent.com/aereal/dotfiles/master/colors/Japanesque/$FILENAME"

if [ ! -e $TEMPDIR ]; then
  mkdir $TEMPDIR
fi

if [ ! -e $TEMPDIR/$FILENAME ]; then
  wget $URL -O $TEMPDIR/$FILENAME
  open $TEMPDIR/$FILENAME
fi
