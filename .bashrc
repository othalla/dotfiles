# .bashrc

# ENV VARS 
bind "\C-w":
bind "\C-a":
bind "\C-e":
set -o vi

export EDITOR=vim
export LANG=en_US.utf8

# Local vars$
export ME=$(uname -n)
export OS=$(uname -s)
export USER=$(whoami)

# HISTORY config
export TERM=xterm-256color
export HISTSIZE=32768
export HISTFILESIZE=32768
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%d/%m/%y %T "
# I3 only
export TERMINAL="urxvt256c"

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

if [ $OS == "FreeBSD" ] ; then
  CUSTOM_COLOR=${B_RED}
else
  CUSTOM_COLOR=${B_BLUE}
fi

# Build PS1
PS1="${CUSTOM_COLOR}\u${END_C}${B_WHITE}@${ENC_C}${CUSTOM_COLOR}\h${END_C}:${B_WHITE}\w${END_C}${CUSTOM_COLOR} # ${END_C}"

# FUNCTIONS
man() {
  LESS_TERMCAP_md=$B_RED
  LESS_TERMCAP_me=$'\e[0m'
  LESS_TERMCAP_se=$'\e[0m'
  LESS_TERMCAP_so=$'\e[01;44;33m'
  LESS_TERMCAP_ue=$'\e[0m'
  LESS_TERMCAP_us=$B_GREE
  command man "$@"
}

# Venv for vim
MYVENV3="${HOME}/venv/bin/activate"
[ -f $MYVENV3 ] && . $MYVENV3

# Autoenv

AUTOENV_FILE="/usr/local/bin/activate.sh"

[ -f $AUTOENV_FILE ] && source $AUTOENV_FILE
