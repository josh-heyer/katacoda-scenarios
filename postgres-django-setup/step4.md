At this point, we’ve got a Postgres database running and connected to a Django project. Now, how can we build out Django further, and leverage the ORM to do the heavy lifting of interacting with the database?

Let’s make the app display a relationship between cars and their owners. Oh, but first: a quick note on Django terminology... 

### Projects and Apps in Django

In the previous step, we created a Django "project". This came with a lot of "stuff" right out of the box - a schema for user management, a default page, an administration UI... But now that we're ready to do some real work, we need to create what Django calls an "app" *within* our project. Each Django project can have multiple apps, intended to separate data and logic into groups of related code. 

So we begin by going back to our old friend `manage.py` and telling it to set up a new app for us:

```
python manage.py startapp cars
```{{execute}}

This creates a basic set of Python classes for us in a subdirectory with the name we gave the app ("cars"):

```
ls -lR cars
```{{execute}}

This gives us the structure of an app. Before we go further, we need to tell Django that it's part of our project, by editing the INSTALLED_APPS list in settings.py:

```
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'cars' # <-- add that
]
```{{execute}}

Let’s tell the framework what a Car and a Driver look like, by defining them in “models.py”:

```
from django.db import models

class Driver(models.Model):
    name = models.TextField()
    license = models.TextField()
    
class Car(models.Model):
    make = models.TextField()
    model = models.TextField()
    year = models.IntegerField()
    vin = models.TextField()
    owner = models.ForeignKey("Driver", on_delete=models.SET_NULL, null=True)
```{{execute}}



Then, make the migration to build the tables in the database, and run it:

```
python manage.py makemigrations cars
python manage.py migrate cars
```{{execute}}

Take a look in the database, and you’ll see that the table has been created with the format “<project_name>_<object_name>”:

```
psql -h db -d demo -U postgres -c '\d'
```{{execute}}

I also created some random data for the purposes of this tutorial:

```
psql -h db -d demo -U postgres -f - <<"EOF"
Insert Into cars_driver (name, license) Values
   ( 'John Doe', 'Z1234567' ),
   ( 'Jane Doe', 'Z9876543')
;

Insert Into cars_car (make, model, year, vin, owner_id) Values 
   ('Ford', 'F-150', '2004', '01083da2df15d6ebfe62186418a76863', 1), 
   ('Toyota', 'Sienna', '2014', '53092a17afa460689ca931f0d459e399', 1), 
   ('Honda', 'Civic', '2018', '844c56840b5fc26d414cf238381a5f1a', 2), 
   ('GMC', 'Sierra', '2012', '29aeffa4d5aa21d25d7196db3728f72c', 2) 
; 
EOF
```{{execute}}

We need to tell Django how to pull stuff out of the database and display it. In Django, that's done with a "view" - so by editing the “cars/views.py” file, we can accomplish this:

```
from django.shortcuts import render
from cars.models import Car, Driver

def car_detail(request, pk):
    owner_obj = Driver.objects.get(pk=pk)
    car_objs = Car.objects.filter(owner_id=owner_obj.id)
    context = {
        "vehicles": car_objs,
        "drivers": owner_obj,
    }
    return render(request, "car_detail.html", context)
```

We also need to define a template so that the “views.py” procedures have a place to send the data. First, we create a “cars/templates/base.html” file that contains the more generic elements of an HTML page:

```
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Contacts</title>
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
    </head>
    
    <body>
{% block page_content %}{% endblock %}
    </body>
</html>
```

Then, we define how the “car_detail.html” template will look, adding it to cars/templates as well:

```
{% extends "base.html" %}
{% block page_content %}
        <div class="mw6 center pa3 sans-serif">
            <h1 class="mb4">Driver: {{ drivers.name | linebreaks }}</h1>
            <header class="b mb2">License: {{ drivers.license }}</header>
        {% for v in vehicles %}
            <div class="pa2 mb3 striped--near-white">
                <div class="pl2">
                    <p class="mb2">Make/Model: {{ v.make }} {{ v.model }}</p>
                    <p class="mb2">Year: {{ v.year }}</p>
                    <p class="mb2">Vin: {{ v.vin }}</p>
                </div>
            </div>
        {% endfor %}
        </div>
{% endblock %}
```

Finally, we need to tell the webserver how to route the traffic. First, in “cars/urls.py”, we define how the REST behavior works:

```
from django.urls import path
from . import views

urlpatterns = [
    path("<int:pk>/", views.car_detail, name="car_detail"),
]
```

Note that this will allow us to retrieve Car and Driver objects based on the ID provided in the URL.

Then, in “myproject/urls.py,” we define the root URL for the “cars” application:

```
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path("cars/", include("cars.urls")),
]
```

Now spin up the webserver again:

```
python manage.py runserver 0.0.0.0:5000
```{{execute}}

And visit [127.0.0.1:5000](https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/cars/1/) to view the results.


Change the “1” to a “2” in the URL, and we will get the Driver with `id=2` and the Cars owned by that Driver:

This is a very simple example of how Django can be used to serve up web pages with data from PostgreSQL. More information about how to define relationships between Django and PostgreSQL (many-to-many relationships, complex joins, complex filtering, etc.) can be found at the [Django documentation](https://docs.djangoproject.com/en/3.0/ref/models/).
