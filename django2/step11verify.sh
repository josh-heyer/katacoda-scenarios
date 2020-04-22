# /bin/bash
[[ $(cat /var/projects/myproject/cars/urls.py | grep "<int:pk>") ]]  && [[ $(cat /var/projects/myproject/myproject/urls.py | grep "cars.urls") ]] && echo "done"