#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $SCRIPTPATH

for i in $(<$SCRIPTPATH/dotfiles)
do
  echo "Creating link for ${i}"
  ln -sf $SCRIPTPATH/$i ~/$i || {
    echo "Erorr while creating link for ${i}"
    exit 1
  }
done
