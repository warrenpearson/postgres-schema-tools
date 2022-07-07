#!/bin/bash

SECRETS_ENV=$1
TABLE=$2

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

pg_dump -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} --format plain --section data --column-inserts --file ./dump_${TABLE}.sql --table ${TABLE} ${PGDATABASE}
