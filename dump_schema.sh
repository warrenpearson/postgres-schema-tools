#!/bin/bash

SECRETS_ENV=$1

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

pg_dump -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -d ${PGDATABASE} -s > ${PGHOST}_${PGDATABASE}.sql
