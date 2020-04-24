#!/bin/bash
stepTitle=$2
case $1 in

   1)
      touch /var/projects/cars.csv
      touch /var/projects/drivers.csv
      # katacoda does not handle psql's pager well AT ALL - locks up the terminal about half the time. Get rid of it
      export PAGER=
      # current working dir is kinda useful
      export PS1="\[\033[01;34m\]\w\[\033[00m\]\$ "
      stepTitle="Begin!"
   ;;
   2)
      cd /var/projects/myproject
   ;;
   [3456789])
   ;;&
   10)
      mkdir /var/projects/myproject/cars/templates
      touch /var/projects/myproject/cars/templates/base.html
      touch /var/projects/myproject/cars/templates/car_detail.html
   ;;&
   11)
      touch /var/projects/myproject/cars/urls.py
   ;;&
   12)
   ;;&
   *)
      cd /var/projects/myproject
      source /var/projects/myproject/myprojectenv/bin/activate
   ;;
esac
clear
echo -e "\e[32mReady for Step #$1: $stepTitle\e[39m"
