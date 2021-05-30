# dotfiles

[![Build Status](https://travis-ci.org/yukirii/dotfiles.svg?branch=main)](https://travis-ci.org/yukirii/dotfiles)

## What's this?
yukirii's configuration files

## How to install

```
curl -LSfs https://raw.githubusercontent.com/yukirii/dotfiles/main/install.sh | bash
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
