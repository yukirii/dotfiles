if [ -e $HOME/.anyenv ]; then
  if [ -z $TMUX ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
  fi
  eval "$(anyenv init - --no-rehash)"
fi
