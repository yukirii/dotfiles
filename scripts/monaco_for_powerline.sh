#!/bin/sh

URL="https://gist.github.com/baopham/1838072/raw/2c0e00770826e651d1e355962e751325edb0f1ee/Monaco%20for%20Powerline.otf"
FILENAME="Monaco for Powerline.otf"

if [ `uname` = 'Darwin' ]; then
  if [ ! -e "/Library/Fonts/$FILENAME" ]; then
    curl $URL -o "/tmp/$FILENAME"
    mv "/tmp/$FILENAME" /Library/Fonts
  fi
fi
