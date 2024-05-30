#!/bin/bash

# Настройки подключения к MySQL
user="root"
pass="qq"
BACKUP_DIR="/home/qqee/backup_db_mysql"

# Получение списка баз данных
DATABASES=$(mysql -u$user -p$pass -e "SHOW DATABASES" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys)")

# Создание директории для резервных копий
mkdir -p $BACKUP_DIR

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
