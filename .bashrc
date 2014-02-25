PATH="$PATH"
PATH="/usr/local/texlive/2013/bin/x86_64-darwin:$PATH"
PATH="~/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH

export HOMEBREW_EDITOR="/usr/local/bin/vim"


if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi

which () {
  (alias; declare -f) | /usr/local/bin/gwhich --tty-only --read-alias\
    --read-functions --show-tilde --show-dot $@
}
export -f which

PS1='\w$(__git_ps1 " (%s)") $ '
export GIT_PS1_SHOWDIRTYSTATE=1

shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s extglob       # Necessary for programmable completion.
shopt -s autocd

export HISTCONTROL=ignoreboth:erasedups   # no duplicate entries
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s histappend histreedit histverify
PROMPT_COMMAND="history -n; history -w; history -c; history -r;$PROMPT_COMMAND"
export PROMPT_COMMAND

alias ls="ls --color=auto"
alias grep="grep --color=auto"

eval $(dircolors -b ~/devops/dircolors-solarized/dircolors.256dark)

## rbenv

export PATH="/Users/tareq/.rbenv/shims:${PATH}"
source "/usr/local/Cellar/rbenv/0.4.0/libexec/../completions/rbenv.bash"

rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}
# vim: set tw=0:
