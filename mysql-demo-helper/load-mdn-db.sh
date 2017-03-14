#!/bin/bash

echo "Downloading MDN sample database"
wget -N ${MDN_SAMPLE_DB_URL} -O /mdn_sample_db.sql.gz
echo "Waiting for mysql service"
urlwait "mysql://${MYSQL_IP}:${MYSQL_PORT}"
echo "Importing database"
zcat /mdn_sample_db.sql.gz | mysql -h ${MYSQL_IP} -P ${MYSQL_PORT} -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE}
echo "Done!"

