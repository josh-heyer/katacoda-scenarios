cp -R ~/myproject/myproject/* ~/tutorial/myproject/myproject
docker cp ~/myproject/myproject/settings.py  `docker ps --filter "ancestor=postgres" -q`:/var/projects/myproject/myproject/settings.py