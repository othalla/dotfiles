# .bashrc

# ENV VARS 
bind "\C-w":
bind "\C-a":
bind "\C-e":
set -o vi

export EDITOR=vi
export LANG=en_US.utf8

# Local vars$
export ME=$(uname -n)
export OS=$(uname -s)
export USER=$(whoami)

# HISTORY config
export HISTSIZE=32768
export HISTFILESIZE=32768
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%d/%m/%y %T "

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
  CUSTOM_C=${B_RED}
else
  CUSTOM_C=${B_BLUE}
fi

# Build PS1
PS1="${B_BLUE}\u${END_C}${B_YELLOW}@${END_C}${CUSTOM_C}\h${END_C}:${B_GREEN}\w${END_C}${B_YELLOW} # ${END_C}"

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
