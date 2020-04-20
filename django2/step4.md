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

This gives us the structure of an app. Before we go further, we need to tell Django that it's part of our project, by editing the INSTALLED_APPS list in `myproject/myproject/settings.py`{{open}}:

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
```{{copy}}

Let’s tell the framework what a Car and a Driver look like, by defining them in `/myproject/cars/models.py`{{open}}:

<pre class="file" data-filename="/myproject/cars/models.py" data-target="replace">from django.db import models

class Driver(models.Model):
    name = models.TextField()
    license = models.TextField()
    
class Car(models.Model):
    make = models.TextField()
    model = models.TextField()
    year = models.IntegerField()
    vin = models.TextField()
    owner = models.ForeignKey("Driver", on_delete=models.SET_NULL, null=True)
</pre>


