autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u%m'
zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u%m' '<!%a>'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '-'

zstyle ':vcs_info:git+set-message:*' hooks \
                                     git-hook-begin \
                                     git-untracked #\
                                     #git-stash-count

function +vi-git-hook-begin() {
  if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
    return 1
  fi
  return 0
}

function +vi-git-untracked() {
  if [[ "$1" != "1" ]]; then
    return 0
  fi

  if command git status --porcelain 2> /dev/null \
      | command grep -F '??' > /dev/null 2>&1 ; then
    hook_com[unstaged]+='?'
  fi
}

function +vi-git-stash-count() {
  if [[ "$1" != "1" ]]; then
    return 0
  fi

  local stash
  stash=$(command git stash list -n 100 2>/dev/null | wc -l | sed 's/^[ \t]*//')
  if [[ "${stash}" -gt 0 ]]; then
    hook_com[misc]+=":S${stash}"
  fi
}

function _update_vcs_info_msg() {
  local -a messages
  local prompt

  LANG=en_US.UTF-8 vcs_info

  if [[ -z ${vcs_info_msg_0_} ]]; then
    prompt=""
  else
    [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
    [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
    [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )
    prompt="${(j: :)messages} "
  fi

  RPROMPT="[${prompt}%~]"
}

add-zsh-hook precmd _update_vcs_info_msg
