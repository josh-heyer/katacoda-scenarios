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
