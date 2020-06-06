# functions
#=====================

# dd cmd progress
function dd_progress() {
  if [ `uname` = 'Darwin' ]; then
    while true; do sudo killall -INFO dd; sleep 2; done
  else
    while true; do sudo killall -USR1 dd; sleep 2; done
  fi
}

# google search
function google() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  firefox http://www.google.co.jp/$opt
}

# University of Tsukuba Library tulips search
function tulips() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt="search?q=${str}"
  fi
  firefox http://tsukuba.summon.serialssolutions.com/$opt
}

# 256colors
function 256colortest() {
    local code
    for code in {0..255}; do
        echo -e "\e[38;05;${code}m $code: Test"
    done
}