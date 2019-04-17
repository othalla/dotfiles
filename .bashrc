# .bashrc

# ENV VARS 
bind "\C-w":
bind "\C-a":
bind "\C-e":
set -o vi

export EDITOR=vim
export LANG=en_US.utf8
export PAGER="less"

# Local vars$
export ME=$(uname -n)
export OS=$(uname -s)
export USER=$(whoami)

# HISTORY config
export TERM=tmux-256color
export HISTSIZE=32768
export HISTFILESIZE=32768
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%d/%m/%y %T "
# I3 only
export TERMINAL="urxvt256c"
# GOPATH
export GOPATH=$HOME/go-projects
export PATH=$HOME/bin:$HOME/go/bin:$PATH

# Source global definitions

if [ -f ~/.bash_aliases ];then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ];then
  . ~/.bash_functions
fi

if [ -f ~/.bash_colors ];then
  . ~/.bash_colors
fi

if [ -f ~/.git-prompt.sh ];then
  . ~/.git-prompt.sh
fi

if [ $OS == "FreeBSD" ] ; then
  CUSTOM_COLOR=${B_RED}
else
  CUSTOM_COLOR=${B_BLUE}
fi

# Build PS1
PS1="${CUSTOM_COLOR}\u${END_C}${B_WHITE}@${ENC_C}${CUSTOM_COLOR}\h${END_C}:${B_WHITE}\w${END_C}\$(__git_ps1 \" (%s)\")${CUSTOM_COLOR} #${END_C} "

# Venv for vim
MYVENV3="${HOME}/venv/bin/activate"
[ -f $MYVENV3 ] && . $MYVENV3

# MAN COLORS - LESS
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Autoenv

AUTOENV_FILE="/usr/local/bin/activate.sh"

[ -f $AUTOENV_FILE ] && source $AUTOENV_FILE
