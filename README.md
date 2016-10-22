# configuration files

## What's this?
shiftky's configuration files

## How to install

```
git clone https://github.com/shiftky/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.py [PROFILE_NAME]
```

### Install AppStore apps

```
# System Preferences > App Store > Password Settings > Free Downloads: [Save Password]
mas signin APPLE_ID PASSWORD
./scripts/mas_install.py
```
