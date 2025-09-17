#!/usr/bin/bash

# copy db seeds from localhost to mongodb container
docker cp /tmp/traders.json mongodb:/tmp/traders.json
docker cp /tmp/accounts.json mongodb:/tmp/accounts.json
docker cp /tmp/securities.json mongodb:/tmp/securities.json
docker cp /tmp/orders.json mongodb:/tmp/orders.json

# import the seeded data into mongodb trading_system database
docker exec -it mongodb mongoimport --db trading_system --collection traders --file /tmp/traders.json --jsonArray
docker exec -it mongodb mongoimport --db trading_system --collection accounts --file /tmp/accounts.json --jsonArray
docker exec -it mongodb mongoimport --db trading_system --collection securities --file /tmp/securities.json --jsonArray
docker exec -it mongodb mongoimport --db trading_system --collection orders --file /tmp/orders.json --jsonArray