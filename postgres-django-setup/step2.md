Now we can install Django:

```
pip install django
```{{execute}}

...And verify that it was installed:

```
django-admin.py --version
```{{execute}}

Remember, this *only* affects our virtual Python environment - if we deactivate that environment with the `deactivate` command,

```
deactivate
```{{execute}}

...Then django disappears:

```
django-admin.py --version
```{{execute}}

> bash: django-admin.py: command not found

Ok, let's jump back into our virtual env and proceed:

```
source /var/projects/myproject/myprojectenv/bin/activate
```{{execute}}
