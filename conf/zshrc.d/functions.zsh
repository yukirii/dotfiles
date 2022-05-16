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

# Get AKS clsuter information by current context
function getakscluster() {
  master=$(kubectl cluster-info | grep "Kubernetes control plane")
  fqdn_port=$(echo "${master#*://}")
  fqdn="${fqdn_port%:*}"

  out=$(az aks list | jq -r ".[] | select (.fqdn == \"$fqdn\")")
  if [ -z "$out" ]; then
    echo "Error: '$fqdn' not found in 'az aks list'"
    return 1
  fi

  echo $out | tr -d '[:cntrl:]'
}

# Start VMSS of AKS cluster set as the current context
function aksvmssstart() {
  node_resource_group=$(getakscluster | jq -r ".nodeResourceGroup")
  echo "Node Resource Group: $node_resource_group"

  vmss_list=$(az vmss list -g $node_resource_group | jq -r ".[].name")
  echo $vmss_list | while read vmss
  do
    echo "VMSS: $vmss"
    az vmss start -g $node_resource_group -n $vmss
  done
}

# Open AKS cluster set as the current context in Azure Portal
function aksportal() {
  id=$(getakscluster | jq -r ".id")
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
