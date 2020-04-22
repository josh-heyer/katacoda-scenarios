# /bin/bash
[ -d "/var/projects/myproject" ] && [[ $(python manage.py diffsettings | grep 'cars') ]] && echo "done"
