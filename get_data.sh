#!/bin/bash

SECRETS_ENV=$1
TABLE=$2

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

mkdir -p ./exports

psql -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -c "COPY (SELECT * FROM ${TABLE} LIMIT 200) TO STDOUT;" ${PGDATBASE} > ./exports/${TABLE}.sql
