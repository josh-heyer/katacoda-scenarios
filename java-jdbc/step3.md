Ok, now let's compile and run it! Note that we specified the classpath as the files in the current directory - this allows JDBC to find the Postgres driver we downloaded in step #1.

```
javac Example.java
java -classpath "./*" Example
```{{execute}}

Lotta tables for a brand-new database, eh? These are the system tables (and views) which exist to support the database itself (and allow you to do cool introspective things like this demo).

Take a minute to play around with the code, see what else you can find in this "empty" database...