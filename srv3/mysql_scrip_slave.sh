#!/bin/bash

config_file="/etc/mysql/mysql.conf.d/mysqld.cnf"
user="root"
pass="qq"
host="192.168.1.11"
user1="repl"

# Добавляем новые строки в файл с помощью echo и оператора перенаправления >>
if [ -f "$config_file" ]; then
    # Добавляем новые строки в файл с помощью echo и оператора перенаправления >>
    echo "server-id = 2" >> $config_file
    echo "read-only = ON" >> $config_file
    echo "gtid-mode=ON" >> $config_file
    echo "enforce-gtid-consistency" >> $config_file
    echo "log-replica-updates" >> $config_file
else
    echo "Файл $config_file не найден"
fi
service mysql restart
echo "Конфиг MySQL настроен!"

# Меняем источник репликации
mysql -u$user -p$pass -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='$host', SOURCE_USER='$user1', SOURCE_PASSWORD='$pass', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"
echo "Источник репликации успешно изменен"
