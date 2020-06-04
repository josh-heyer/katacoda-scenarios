#!/bin/bash
stepTitle=$2
case $1 in

   1)
      # katacoda does not handle psql's pager well AT ALL - locks up the terminal about half the time. Get rid of it
      export PAGER=
      # current working dir is kinda useful
      export PS1="\[\033[01;34m\]\w\[\033[00m\]\$ "
      stepTitle="Begin!"
   ;;
   [23])
   ;;
esac
clear
echo -e "\e[32mReady for Step #$1: $stepTitle\e[39m"
