To use Postgres from Python, we'll want to use [psycopg2](https://www.psycopg.org/). This is what is known as a "database adapter library" - it adapts [the standard Python database API](https://www.python.org/dev/peps/pep-0249/) to work with [libpg](https://www.postgresql.org/docs/current/libpq.html), the standard Postgres client library. In other words, it lets us - and Django - talk to Postgres in a Pythonic fashion.

We'll install psycopg2 into our virtual environment the same way we've installed everything else:

```
pip install psycopg2
```{{execute}}

