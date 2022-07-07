#!/bin/bash

SECRETS_ENV=$1
QUERY=$2
TABLE=$3

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

mkdir -p ./exports

psql -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -c "COPY (${QUERY}) TO STDOUT;" ${PGDATBASE} > ./exports/${TABLE}.sql
