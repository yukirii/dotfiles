export PATH="$HOME/Library/Python/2.7/bin:$PATH"

if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# alias
alias dnscache_clear='sudo killall -HUP mDNSResponder'
alias ddprogress='while true; do sudo killall -INFO dd; sleep 2; done'
alias libtool='glibtool'
alias libtoolize='glibtoolize'
if type ggrep &>/dev/null; then
  alias grep='ggrep'
fi

# Application Shortcuts
alias firefox='open -a Firefox'
alias safari='open -a safari'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias cot='open -a CotEditor'
alias marked='open -a /Applications/Marked\ 2.app'