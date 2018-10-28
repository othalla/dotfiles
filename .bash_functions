#!/bin/bash
# My Functions

function list_functions {
  grep function ~/.bash_functions	
}

function virton {
  sudo systemctl start virtlogd.service
  sudo systemctl start libvirtd.service
  sudo systemctl start libvirt.*
}

function bkfile () { 
  typeset PREFIX_CMD="sudo "
  typeset FNAME_TAG="FCHARDIN"
  typeset BKDATE="$(date +%Y%m%d-%H%M)"
  typeset OS=$(uname -s)
  typeset FILE_OWNUID
  typeset MYUID
  [[ "$#" == 1 ]] || {
    echo "Must be used with only one param : filename"
    return 1
  } 
  [[ -f $1 ]] || {
    echo "$1 -- PROBLEM !"
    echo "Is a file ?"
    echo "Does it exists?"
    return 1
  }
  case $OS in 
    Linux) 
      FILE_OWNUID="$(stat -c %u $1)"
      MYUID="$(id -u)"
      ;; 
    Solaris | SunOS) 
      FILE_OWNUID=$(/usr/xpg4/bin/id -u $(ls -la $1 | awk '{print $3}'))
      MYUID=$(/usr/xpg4/bin/id -u $(/usr/ucb/whoami)) 
      ;; 
    FreeBSD)
      FILE_OWNUID="$(/usr/bin/stat -f %f $1)"
      ;;
    *) 
      echo "WTF?"
      return 1
      ;;
  esac
  typeset BKFILE="$1.${BKDATE}.${FNAME_TAG}.OLD"
  [[ "$MYUID" == "$FILE_OWNUID" ]] && PREFIX_CMD=""
    $PREFIX_CMD cp -p $1 $BKFILE && {
    echo -e "COPY $BKFILE ${BGREEN}OK${RC}"
    return 0
  } || {
    echo "Error while creating/copying Backup File !"
    return 1 
  }
}

help_for () {
  [ -f ~/docs/$1 ] && {
    cat ~/docs/$1
    return 0
  }
  echo "Documentation for $i not found!"
  return 1
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
