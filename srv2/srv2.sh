#!/bin/bash
a2enmod rewrite
systemctl restart apache2
rsync -av /root/otus_test/srv2/www/html/ /var/www/html
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
sudo rm /var/www/html/index.html
cp /root/otus_test/srv2/000-default.conf /etc/apache2/sites-available/000-default.conf
systemctl reload apache2
cp /root/otus_test/srv2/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql


# Настройки подключения к MySQL
user="root"
pass="Qq123456"
BACKUP_DIR="/root/otus_test/srv2/"

mysql -u$user -p$pass -e "CREATE DATABASE wp_database;"
mysql -u$user -p$pass -e "CREATE USER 'stivik'@'localhost' IDENTIFIED BY 'Qq123456';"
mysql -u$user -p$pass -e "GRANT ALL PRIVILEGES ON wp_database.* TO 'stivik'@'localhost';"
mysql -u$user -p$pass -e "FLUSH PRIVILEGES;"

cd otus_test/srv2/
mysql -u root -p wp_database < dump.sql
cd

# Создаём пользователя для реплики
mysql -u$user -p$pass -e "CREATE USER 'repl'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'Qq123456';"
# Даём ему права на репликацию

# Цикл по базам данных
for DB_NAME in $DATABASES; do
    # Создание имени файла для резервной копии в формате "название_базы_данных.sql"
    FILENAME="${DB_NAME}_backup_mysql.sql"
    # Создание полного пути к файлу резервной копии
    BACKUP_PATH="${BACKUP_DIR}/${FILENAME}"
    # Создание резервной копии базы данных
     mysqldump -u$user -p$pass --set-gtid-purged=OFF --source-data=1 --add-drop-table --databases --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers $DB_NAME > $BACKUP_PATH
    # Проверка успешности выполнения команды mysqldump
    if [ $? -eq 0 ]; then
        echo "Резервная копия Б/Д $DB_NAME создана успешно. Путь к Б/Д: $BACKUP_PATH"
    else
        echo "Возникла ошибка при создании резервной копии базы данных $DB_NAME"
    fi
done

mysql -u$user -p$pass -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';"
echo "Пользователь repl добавлен в MySQL и получил права на репликацию."
# Устанавливаем пароль
mysql -u$user -p$pass -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'Qq123456';"
echo "Для пользователь repl в MySQL, установлен пароль Qq123456"
echo "Сервис Mysql готов к работе!"

# Получение списка баз данных
DATABASES=$(mysql -u$user -p$pass -e "SHOW DATABASES" | grep -Ev "(Database|information_schema|performance_schema|mysql>

# Создание директории для резервных копий
mkdir -p $BACKUP_DIR
