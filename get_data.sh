#!/bin/bash

SECRETS_ENV=$1
TABLE=$2

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

psql -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -c "COPY (SELECT * FROM ${TABLE} LIMIT 10) TO STDOUT;" ${PGDATBASE} > ${TABLE}.sql
