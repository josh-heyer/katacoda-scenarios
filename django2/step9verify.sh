#!/bin/bash
[[ $(psql "postgresql://postgres:password@localhost/demo" -c 'select count(*) from cars_car' | grep 4) ]] && echo "done"