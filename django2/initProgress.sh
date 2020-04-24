#!/bin/bash
sleep 1; wait.sh
# katacoda does not handle psql's pager well AT ALL - locks up the terminal about half the time. Get rid of it
export PAGER=
# current working dir is kinda useful
export PS1="\[\033[01;34m\]\w\[\033[00m\]\$ "
source prepareStep.sh 1 "Katacoda's UI and some data to work with"