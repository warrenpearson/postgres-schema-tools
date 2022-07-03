#!/bin/bash

# To be paranoid, only copy _to_ dev
SECRETS_ENV=dev
TABLE=$1

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

cat ./exports/${TABLE}.sql | psql -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -c "COPY ${TABLE} FROM STDIN;" ${PGDATBASE}
