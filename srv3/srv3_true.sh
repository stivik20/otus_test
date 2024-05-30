#!/bin/bash
cp /root/otus_test/srv3/000-default.conf /etc/apache2/sites-available/000-default.conf
systemctl reload apache2
cp /root/otus_test/srv3/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

config_file="/etc/mysql/mysql.conf.d/mysqld.cnf"
user="root"
pass="Qq123456"
host="192.168.0.51"
user1="repl"

# Меняем источник репликации
mysql -u$user -p$pass -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='$host', SOURCE_USER='$user1', SOURCE_PASSWORD='$pass', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"
echo "Источник репликации успешно изменен"
