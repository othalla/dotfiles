#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

for file in $(cat $SCRIPTPATH/dotfiles)
do
  echo "Creating link for $file"
  ln -sf $SCRIPTPATH/$file ~/$file || {
    echo "Erorr while creating link for $file"
    exit 1
  }
done
