#!/bin/bash

config_file="/etc/mysql/mysql.conf.d/mysqld.cnf"
user="root"
pass="Qq123456"
host="192.168.0.51"
user1="repl"

# Меняем источник репликации
mysql -u$user -p$pass -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='$host', SOURCE_USER='$user1', SOURCE_PASSWORD='$pass', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"
echo "Источник репликации успешно изменен"
