# /bin/bash
source /var/projects/myproject/myprojectenv/bin/activate
[[ $(python manage.py diffsettings | grep environments.katacoda.com) ]] && echo "done"
