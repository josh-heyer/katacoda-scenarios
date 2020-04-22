# /bin/bash
[ [[ $(python manage.py diffsettings | grep environments.katacoda.com) ]] && echo "done"
