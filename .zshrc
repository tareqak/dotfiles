autoload -Uz promptinit
promptinit

fpath=(~/dotfiles/zsh-completions $fpath)

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt share_history
# Keep 25000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=25000
SAVEHIST=25000
HISTFILE=~/.zsh_history

#setopt ignore_eof
bindkey -e

DIRSTACKSIZE=16
#setopt auto_pushd
setopt pushd_ignore_dups
#setopt pushd_minus

setopt noflowcontrol

# like readline's history-search-backward and history-search forward
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

bindkey "\C-b" backward-word
bindkey "\C-f" forward-word

eval "$(dircolors -b ~/dotfiles/dircolors-solarized/dircolors.ansi-dark)"

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:default' menu select=0
zstyle ':completion:*:default' select-scroll 0

zstyle ':completion:*' rehash true

# Aliases
alias cp='cp -iv'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"
alias mkdir="mkdir -v"

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
#alias ls="ls -F --color=auto"
#alias grep="grep --color=auto"

. ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. /usr/local/Cellar/git/*/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
precmd () { __git_ps1 "" $'%D{%Y%m%d%a %T.%6.}\n%F{green}%0~%f\n' "(%s) " }

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

. ~/dotfiles/z/z.sh

if [ -e ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi

# vim: set sts=2:

