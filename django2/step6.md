We need to tell Django how to pull stuff out of the database and display it. In Django, that's done with a "view" - so by editing the `.myproject/cars/views.py`{{open}} file, we can accomplish this:

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

We also need to define a template so that the “views.py” procedures have a place to send the data. First, we create a `./myproject/cars/templates/base.html`{{open}} file that contains the more generic elements of an HTML page:

<pre class="file" data-filename="/var/projects/myproject/cars/templates/base.html" data-target="replace">&lt;html&gt;
    &lt;head&gt;
        &lt;meta charset="utf-8"&gt;
        &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;

        &lt;title&gt;Contacts&lt;/title&gt;
        &lt;link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/&gt;
    &lt;/head&gt;

    &lt;body&gt;
{% block page_content %}{% endblock %}
    &lt;/body&gt;
&lt;/html&gt;</pre>

Then, we define how the `/var/projects/myproject/cars/templates/car_detail.html`{{open}} template will look:

<pre class="file" data-filename="/var/projects/myproject/cars/templates/car_detail.html" data-target="replace">{% extends "base.html" %}
{% block page_content %}
        &lt;div class="mw6 center pa3 sans-serif"&gt;
            &lt;h1 class="mb4"&gt;Driver: {{ drivers.name | linebreaks }}&lt;/h1&gt;
            &lt;header class="b mb2"&gt;License: {{ drivers.license }}&lt;/header&gt;
        {% for v in vehicles %}
            &lt;div class="pa2 mb3 striped--near-white"&gt;
                &lt;div class="pl2"&gt;
                    &lt;p class="mb2"&gt;Make/Model: {{ v.make }} {{ v.model }}&lt;/p&gt;
                    &lt;p class="mb2"&gt;Year: {{ v.year }}&lt;/p&gt;
                    &lt;p class="mb2"&gt;Vin: {{ v.vin }}&lt;/p&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        {% endfor %}
        &lt;/div&gt;
{% endblock %}
</pre>

Finally, we need to tell the webserver how to route the traffic. First, in `/var/projects/myproject/cars/urls.py`{{open}}, we define how the REST behavior works:

<pre class="file" data-filename="/var/projects/myproject/cars/models.py" data-target="replace">from django.urls import path
from . import views

urlpatterns = [
    path("&lt;int:pk&gt;/", views.car_detail, name="car_detail"),
]
</pre>

Note that this will allow us to retrieve Car and Driver objects based on the ID provided in the URL.

Then, in `/var/projects/myproject/urls.py`{{open}} we define the root URL for the “cars” application:

<pre class="file" data-filename="/var/projects/myproject/urls.py" data-target="replace">
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path("cars/", include("cars.urls")),
]
</pre>

Now spin up the webserver again:

```
python manage.py runserver 0.0.0.0:5000
```{{execute}}

And visit <https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/cars/1/> to view the results.


Change the “1” to a “2” in the URL, and we will get the Driver with `id=2` and the Cars owned by that Driver:

This is a very simple example of how Django can be used to serve up web pages with data from PostgreSQL. More information about how to define relationships between Django and PostgreSQL (many-to-many relationships, complex joins, complex filtering, etc.) can be found at the [Django documentation](https://docs.djangoproject.com/en/3.0/ref/models/).
