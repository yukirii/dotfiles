if [ -e $HOME/.anyenv ]; then
  if [ -z $TMUX ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
  fi

  if ! [ -f /tmp/anyenv.cache ]; then
    anyenv init - --no-rehash > /tmp/anyenv.cache
    zcompile /tmp/anyenv.cache
  fi
  source /tmp/anyenv.cache
fi
