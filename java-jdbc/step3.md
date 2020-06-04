Ok, now let's compile and run it! 

Note that we must specify the classpath as the current directory (`.`) and the driver we downloaded in step #1 - this allows JDBC to load Postgres support in response to the connection string.

```
javac Example.java
java -classpath ".:postgresql-42.2.13.jar" Example
```{{execute}}

Lotta tables for a brand-new database, eh? These are the system tables (and views) which exist to support the database itself (and allow you to do cool introspective things like this demo).

Take a minute to play around with the code, see what else you can find in this "empty" database...