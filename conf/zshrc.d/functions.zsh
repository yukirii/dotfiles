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

# Open AKS cluster set as the current context in Azure Portal
function aksportal() {
  master=$(kubectl cluster-info | grep "Kubernetes master")
  fqdn_port=$(echo "${master#*://}")
  fqdn="${fqdn_port%:*}"
  echo "Current master: $fqdn"

  id=$(az aks list | jq -r ".[] | select (.fqdn == \"$fqdn\") | .id")
  if [ -z "$id" ]; then
    echo "Error: '$fqdn' not found in 'az aks list'"
    return 1
  fi

  echo $id
  url="https://portal.azure.com/#resource$id/overview"
  echo "Opening $url"

  if [ `uname` = 'Darwin' ]; then
    open $url
  else
    if uname -r | grep microsoft; then
      cmd.exe /C start $url
    fi
  fi
}

# fix bp permission
function fix_bp_permission() {
  sudo chown $(whoami):admin /dev/bp*
}

alias nsg='bash <(curl -s https://raw.githubusercontent.com/taoyama/Add-NSG-Rule/master/nsg.sh)'

function bingwork() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt="search?q=${str}"
  fi
  echo "https://www.bing.com/work/$opt"
  cmd.exe /C start https://www.bing.com/work/$opt
}
