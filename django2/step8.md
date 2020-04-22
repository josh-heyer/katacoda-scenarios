Let’s tell the framework what a Car and a Driver look like, by defining them in `myproject/cars/models.py`{{open}}:

<pre class="file" data-filename="myproject/cars/models.py" data-target="replace">from django.db import models

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

Each model is just a Plain Old Python Object with fields set according to how we want that data to be represented in Postgres. For the most part, that's pretty simple - Text and Integers. The most interesting field is `owner` - we're defining this as a foreign key into the Driver table, with a rule (`on_delete`) that instructs the database on what it should do if the associated row in that table is deleted (set `owner` to null). 

You can find more details on configuring model fields in [the relevant Django documentation](https://docs.djangoproject.com/en/3.0/ref/models/fields/#module-django.db.models.fields).