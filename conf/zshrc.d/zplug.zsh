if [ -e $HOME/.zplug ]; then
  source $HOME/.zplug/init.zsh
  zplug "zsh-users/zsh-completions", lazy:true
  zplug "zsh-users/zsh-syntax-highlighting", defer:2, lazy:true
  zplug load
fi
