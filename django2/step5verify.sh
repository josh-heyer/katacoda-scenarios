# /bin/bash
[ [[ $(psql "postgresql://postgres:password@localhost/demo" -c '\d' | grep "auth_user") ]] && echo "done"
