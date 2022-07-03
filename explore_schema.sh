#!/bin/bash

SECRETS_ENV=$1
TABLE_LIST=$2
PAGER=on

source ./secrets.${SECRETS_ENV}
echo "Using params ${PGUSER} ${PGHOST} ${PGPORT} ${PGDATABASE}"

for TABLE in `more ${TABLE_LIST}`
do
  echo ${TABLE}
  psql -P pager=${PAGER} -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -d ${PGDATABASE} -c "SELECT * FROM ${TABLE} LIMIT 10;"
  psql -P pager=${PAGER} -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -d ${PGDATABASE} -c "SELECT COUNT(*) FROM ${TABLE};"
  psql -P pager=${PAGER} -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -d ${PGDATABASE} -c "SELECT PG_SIZE_PRETTY(PG_RELATION_SIZE('${TABLE}')) AS \"${TABLE}_size\";"
done

psql -P pager=${PAGER} -U ${PGUSER} -h ${PGHOST} -p ${PGPORT} -d ${PGDATABASE} -c "select pg_size_pretty(pg_database_size('${PGDATABASE}')) AS \"${PGDATABASE}_size\";"
