#!/bin/bash
source /var/projects/myproject/myprojectenv/bin/activate
[[ $(pip list | grep "psycopg2") ]] && echo "done"
