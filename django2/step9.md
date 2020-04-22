Now we'll create the migration to build the tables in the database:

```
python manage.py makemigrations cars
```{{execute}}

If you have a look inside cars/migrations you'll see a file named `0001_initial.py` has been created - this contains some Python code that tells Django how to create the schema for the models we generated earlier. 

Now run the migration to actually create that schema:

```
python manage.py migrate cars
```{{execute}}

Take a look in the database, and you’ll see that the tables have been created with the format `<project_name>_<object_name>`:

```
psql "postgresql://postgres:password@localhost/demo" -c '\d'
```{{execute}}

Now let's populate the data we created in step #1:

```
psql "postgresql://postgres:password@localhost/demo" -c "\copy cars_driver from /var/projects/drivers.csv (format csv)"
psql "postgresql://postgres:password@localhost/demo" -c "\copy cars_car from /var/projects/cars.csv (format csv)"
```{{execute}}

This uses psql's \copy command to import the data into the tables that we created with our migration. Now we can use Django to get that data back out!