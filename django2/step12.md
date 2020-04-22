We should be ready to go, so spin up the webserver again:

```
python manage.py runserver 0.0.0.0:5000
```{{execute}}

And visit <https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/cars/1/> to view the results.


Change the “1” to a “2” in the URL, and we will get the Driver with `id=2` and the Cars owned by that Driver:

This is a very simple example of how Django can be used to serve up web pages with data from PostgreSQL. More information about how to define relationships between Django and PostgreSQL (many-to-many relationships, complex joins, complex filtering, etc.) can be found at the [Django documentation](https://docs.djangoproject.com/en/3.0/ref/models/).
