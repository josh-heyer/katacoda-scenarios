To use Postgres from Python, we'll want to use [psycopg2](https://www.psycopg.org/). This is what is known as a "database adapter library" - it adapts [the standard Python database API](https://www.python.org/dev/peps/pep-0249/) to work with [libpg](https://www.postgresql.org/docs/current/libpq.html), the standard Postgres client library. In other words, it lets us - and Django - talk to Postgres in a Pythonic fashion.

We'll install psycopg2 into our virtual environment the same way we've installed everything else:

```
pip install psycopg2
```{{execute}}

If you happen to see an error at this stage...

> Error: pg_config executable not found.

or

> ./psycopg/psycopg.h:36:10: fatal error: libpq-fe.h: No such file or directory

...then you'll need to pause and install the PostgreSQL dev libraries

```
apt-get install libpq-dev
```

With that out of the way, we're ready to set up a Django project and connect it to Postgres. That starts with... The `startproject` command!

```
django-admin.py startproject myproject .
```{{execute}}

This creates a subdirectory named "myproject" under the current directory with an initial project configuration. By default, Django is configured to use SQLite as its backend. To use Postgres instead, `myproject/myproject/settings.py`{{open}} needs to be updated:

Scroll down to the Database section, and replace it with settings for Postgres

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'demo',
        'USER': 'postgres',
        'PASSWORD': 'password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

Once you’ve got things pointed to the Postgres database, you can build the default schema. If you didn’t know already, Django was designed with user access in mind, so by default a Django application will create a database schema involving users, groups, and permissions. To create the schema, generate a migration with the manage.py script:

```
python manage.py makemigrations
```{{execute}}

(there won't be anything listed here, yet)

And then run the migration:

```
python manage.py migrate
```{{execute}}

Since we're making use of Django's user management system, we should create a superuser to manage the app:

```
python manage.py createsuperuser
```{{execute}}

Follow the prompts and enter some name and password (one you can remember for two steps), and an email (not used for this tutorial).

Now, the moment of truth! Start the application up, and point your browser to the corresponding port:

```
python manage.py runserver 0.0.0.0:5000
```{{execute}}

This specifies the port as 5000, so try <https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/>... And, you'll see an error:

> DisallowedHost at /

This is **good** - Django is configured by default to protect against [Host forgery attacks](https://docs.djangoproject.com/en/3.0/topics/security/#host-headers-virtual-hosting). We just need to tell it the name of the host we're using. Open up `/var/projects/myproject/myproject/settings.py`{{open}} again, and edit the ALLOWED_HOSTS line:

```
ALLOWED_HOSTS = ["[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com"]
```{{copy}}

Observe in the console that the development server automatically reloads as soon as you change this file - this can save a lot of time when testing! If you closed the development server by pressing <kbd>Ctrl</kbd>+<kbd>C</kbd> (or it crashed...) you can restart it with the `runserver` command used above.

Now reload <https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/> - if you see the rocket launch, we've successfully configured Django!

To verify that your superuser works, go to [the “/admin” page](https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/admin) and enter the name and password you specified when creating the superuser. You should see a full interface for managing users!

Ok, now hit <kbd>Ctrl</kbd>+<kbd>C</kbd>{{execute interrupt}}  to kill the development server and let's build a real app...