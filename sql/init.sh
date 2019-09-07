#!/bin/bash
set -xe
set -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
export MYSQL_HOST=${MYSQL_HOST:-127.0.0.1}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-isucari}
export MYSQL_DBNAME=${MYSQL_DBNAME:-isucari}
export MYSQL_PWD=${MYSQL_PASS:-isucari}
export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 01_schema.sql 02_categories.sql initial.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME

mysql $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME -e "alter table items add index idx_seller_id(seller_id);"
mysql $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME -e "alter table items add index idx_created_at_id(created_at, id);"
