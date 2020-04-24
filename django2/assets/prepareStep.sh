#!/bin/bash
case $1 in

  1)
    touch /var/projects/cars.csv
    touch /var/projects/drivers.csv
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
echo "Ready for Step #$1!"
