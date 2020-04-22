# /bin/bash
[ -d "/var/projects/myproject" ] && [[ $(cat /var/projects/cars.csv | grep "1,Ford") ]]  && [[ $(cat /var/projects/drivers.csv | grep "1,John") ]] && echo "done"
