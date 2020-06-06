function peco-history-selection() {
  if [ `uname` = 'Darwin' ]; then
    BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
  else
    BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco | sed -e 's/\\n/\n/'`
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
    kubectl ssh-jump $node
  fi
}

alias kssh='peco-kubectl-ssh-jump'
