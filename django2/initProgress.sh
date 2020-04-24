#!/bin/bash
# katacoda does not handle psql's pager well AT ALL - locks up the terminal about half the time. Get rid of it
export PAGER=
sleep 1; wait.sh