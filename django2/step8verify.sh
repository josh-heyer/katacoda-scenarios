#!/bin/bash
[[ $(cat /var/projects/myproject/cars/models.py | grep "Car(models.Model)") ]] && echo "done"
