#!/bin/bash
source /var/projects/myproject/myprojectenv/bin/activate
[[ $(python /var/projects/myproject/manage.py diffsettings | grep environments.katacoda.com) ]] && echo "done"
