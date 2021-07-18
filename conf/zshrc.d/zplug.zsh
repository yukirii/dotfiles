if [ -e $HOME/.zplug ]; then
  source $HOME/.zplug/init.zsh
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "nnao45/zsh-kubectl-completion"
  zplug load
fi
