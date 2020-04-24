#!/bin/bash
source /var/projects/myproject/myprojectenv/bin/activate
[ -d "/var/projects/myproject" ] && [[ $(python /var/projects/myproject/manage.py diffsettings | grep 'cars') ]] && echo "done"
