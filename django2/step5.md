We're ready to set up a Django project and connect it to Postgres. That starts with... The `startproject` command!

```
django-admin.py startproject myproject .
```{{execute}}

This creates a subdirectory named "myproject" under the current directory with an initial project configuration. By default, Django is configured to use SQLite as its backend. But, we want Postgres!

Open `myproject/myproject/settings.py`{{open}} 

Scroll down to the Database section, and replace the `DATABASES` definition with settings for Postgres as follows:

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
```{{copy}}


## Building and running migrations

Django uses migrations to create its schemas. If you didn’t know already, Django was designed with user access in mind, so by default a Django application will create a database schema involving users, groups, and permissions. 

To create the default schema, generate a migration with the manage.py script:

```
python manage.py makemigrations
```{{execute}}

(there won't be anything listed here, yet)

And then run the migration:

```
python manage.py migrate
```{{execute}}

We can use Postgres's `psql` command to list the tables created for us by that migration:

```
psql "postgresql://postgres:password@localhost/demo" -c '\d'
```{{execute}}

In addition to user management, there are also tables for Django to track migrations themselves - this allows it to automatically update our own schemas as they change over time.