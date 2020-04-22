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
