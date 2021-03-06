PATH="$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="~/bin:$PATH"
export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH

export EDITOR="/usr/local/bin/vim"

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
fi

#PS1='\w$(__git_ps1 " (%s)") $ '
#GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWSTASHSTATE=1

shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s extglob       # Necessary for programmable completion.
#shopt -s autocd

export HISTCONTROL=ignoreboth:erasedups   # no duplicate entries
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s histappend histreedit histverify
PROMPT_COMMAND="history -n; history -w; history -c; history -r;$PROMPT_COMMAND"
export PROMPT_COMMAND

alias ls="ls -F --color=auto"
alias grep="grep --color=auto"

#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/src
#source /usr/local/bin/virtualenvwrapper.sh

. ~/dotfiles/z/z.sh

eval $(dircolors -b ~/dotfiles/dircolors-solarized/dircolors.ansi-dark)
# vim: set tw=0:
