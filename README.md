# dotfiles

[![Build Status](https://travis-ci.org/shiftky/dotfiles.svg?branch=master)](https://travis-ci.org/shiftky/dotfiles)

## What's this?
shiftky's configuration files

## How to install

```
curl -LSfs https://raw.githubusercontent.com/shiftky/dotfiles/master/install.sh | bash
```

## Install AppStore apps

```
# System Preferences > App Store > Password Settings > Free Downloads: [Save Password]
mas signin APPLE_ID PASSWORD
for app in `cat $HOME/.dotfiles/mas.list | awk '{ print $1 }'`
do
  mas install $app
done
```
