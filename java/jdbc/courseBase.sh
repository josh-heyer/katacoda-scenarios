#!/bin/bash
docker run --name demopg -e POSTGRES_PASSWORD=password -p 5432:5432 -e POSTGRES_DB=demo -d postgres
echo "done" >> /root/katacoda-finished
echo "done" >> /root/katacoda-background-finished
