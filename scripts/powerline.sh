#!/bin/sh

function install_python() {
  brew list | grep python
  ret=$?
  if [ $ret != 0 ]; then
    brew install python
  fi
}

function install_powerline_status() {
  pip list | grep powerline-status
  ret=$?
  if [ $ret != 0 ]; then
    pip install --user powerline-status
  fi
}

install_python
install_powerline_status
