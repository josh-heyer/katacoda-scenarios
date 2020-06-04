First, we need a JDBC *driver* - a bit of compiled Java code that'll tell JDBC how to connect to Postgres. We can get that from https://jdbc.postgresql.org/download.html

```
wget https://jdbc.postgresql.org/download/postgresql-42.2.13.jar
```{execute}
