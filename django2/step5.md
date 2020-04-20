
Then, make the migration to build the tables in the database, and run it:

```
python manage.py makemigrations cars
python manage.py migrate cars
```{{execute}}

Take a look in the database, and you’ll see that the table has been created with the format “<project_name>_<object_name>”:

(the next two commands will require you to enter a password - it's "password")

```
psql -h db -d demo -U postgres -c '\d'
```{{execute}}

I also created some random data for the purposes of this tutorial:

```
psql -h db -d demo -U postgres -f - <<"EOF"
Insert Into cars_driver (name, license) Values
   ( 'John Doe', 'Z1234567' ),
   ( 'Jane Doe', 'Z9876543')
;

Insert Into cars_car (make, model, year, vin, owner_id) Values 
   ('Ford', 'F-150', '2004', '01083da2df15d6ebfe62186418a76863', 1), 
   ('Toyota', 'Sienna', '2014', '53092a17afa460689ca931f0d459e399', 1), 
   ('Honda', 'Civic', '2018', '844c56840b5fc26d414cf238381a5f1a', 2), 
   ('GMC', 'Sierra', '2012', '29aeffa4d5aa21d25d7196db3728f72c', 2) 
; 
EOF
```{{execute}}

