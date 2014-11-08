PATH="$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="~/bin:$PATH"
export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH

export EDITOR="/usr/local/bin/vim"

autoload -Uz promptinit
promptinit
prompt walters

setopt histignorealldups sharehistory

bindkey -e

# like readline's history-search-backward and history-search forward
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b ~/dotfiles/dircolors-solarized/dircolors.256dark)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls="ls -F --color=auto"
alias grep="grep --color=auto"

. ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/local/etc/profile.d/z.sh

. /usr/local/Cellar/git/2.1.3/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
precmd () { __git_ps1 "" "$ " "(%s) " }

