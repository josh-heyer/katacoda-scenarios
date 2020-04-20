cp -R ~/myproject/cars/* ~/tutorial/myproject/cars
docker cp ~/myproject/myproject/settings.py  `docker ps --filter "ancestor=postgres" -q`:/var/projects/myproject/myproject/settings.py
docker cp ~/myproject/cars/*  `docker ps --filter "ancestor=postgres" -q`:/var/projects/myproject/cars/
