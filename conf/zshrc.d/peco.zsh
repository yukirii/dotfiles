function peco-history-selection() {
  if [ `uname` = 'Darwin' ]; then
    BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco | sed -e 's/\\n/\n/g')
  else
    BUFFER=$(history -n 1 | tac | awk '!a[$0]++' | peco | sed -e 's/\\n/\n/g')
  fi
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-kubectl-switch-context(){
  ctx=$(kubectl config get-contexts | peco --initial-index=1 --prompt='kubectl config use-context > ' | sed -e 's/^\*//' | awk '{ print $1 }')
  if [ -n "$ctx" ]; then
    kubectl config use-context $ctx
  fi
}

alias kctx='peco-kubectl-switch-context'

function peco-kubectl-ssh-jump(){
  node=$(kubectl get nodes --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | peco --prompt='kubectl ssh-jump > ')
  if [ -n "$node" ]; then
    ipaddr=$(kubectl get nodes -o wide | grep $node | awk '{ print $6 }')
    kubectl ssh-jump $ipaddr
  fi
}

alias kssh='peco-kubectl-ssh-jump'

function peco-kubectl-node-shell(){
  node=$(kubectl get nodes --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | peco --prompt='kubectl node-shell > ')
  if [ -n "$node" ]; then
    kubectl node-shell $node
  fi
}

alias knode-shell='peco-kubectl-node-shell'

function peco-kubectl-exec(){
  pod=$(kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | peco)
  if [ -n "$pod" ]; then
    echo $pod
    kubectl exec -it $pod $*
  fi
}

alias kexec='peco-kubectl-exec'
