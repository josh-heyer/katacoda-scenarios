# /bin/bash
source /var/projects/myproject/myprojectenv/bin/activate
[[ $(django-admin.py --version) ]] && echo "done"