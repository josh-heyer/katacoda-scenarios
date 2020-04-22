Since we've allowed Django to create a user management system, we should create a superuser to manage the app:

```
python manage.py createsuperuser
```{{execute}}

The terminal is prompting you for information now: enter some name and password (one you can remember for just a minute), and an email (not used for this tutorial).

Now, the moment of truth! Start the application up:

```
python manage.py runserver 0.0.0.0:5000
```{{execute}}

We specified port 5000, which in Katacoda means our new site is at a link like this:

<https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/> (on your own machine, it'd be at `localhost:500` instead)

You'll see an error on that page:

> DisallowedHost at /

This is **good!** Django is configured by default to protect against [Host forgery attacks](https://docs.djangoproject.com/en/3.0/topics/security/#host-headers-virtual-hosting). We just need to tell it the name of the host we're using. 

Open `myproject/myproject/settings.py`{{open}} again, and change the ALLOWED_HOSTS line:

```
ALLOWED_HOSTS = ["[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com"]
```{{copy}}


Observe in the console that the development server automatically reloads as soon as you change this file - this can save a lot of time when testing!

(If you closed the development server by pressing <kbd>Ctrl</kbd>+<kbd>C</kbd> (or it crashed...) you can restart it with the `runserver` command used at the start of this step)

Now reload <https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/> - if you see the rocket launch, we've successfully configured Django!

To verify that your superuser works, go to [the “/admin” page](https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/admin) and enter the name and password you specified when creating the superuser. You should see a full interface for managing users!

Ok, now hit <kbd>Ctrl</kbd>+<kbd>C</kbd>`  `{{execute interrupt}} in the terminal to kill the development server and let's build a real app...