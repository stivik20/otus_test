#!/bin/bash
rsync -av /root/otus_test/srv2/www/html /var/www/html
#chown -R www-data:www-data /var/www/html/
#chmod -R 755 /var/www/html/
cp /root/otus_test/srv2/000-default.conf /etc/apache2/sites-available/000-default.conf
systemctl reload apache2
cp /root/otus_test/srv2/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

#backup_dir="/root/otus_test/mysql_backup/"
#for db_dir in $(ls $backup_dir); do
#    db=$(basename $db_dir)
#    for tbl_dir in $(ls $backup_dir/$db); do
#        tbl=$(basename $tbl_dir)
#        tbl_backup="$backup_dir/$db/$tbl/$tbl.sql"
#        mysql -u root -e "CREATE DATABASE IF NOT EXISTS $db;"
#        mysql -u root $db < $tbl_backup
#    done
#done

DB_NAME="wp_database"
DB_USER="wp_user"
DB_PASSWORD="Qq123456"
DB_REPL_USER="repl"
DB_REPL_PASSWORD="Qq123456"
MYSQL_COMMANDS="CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
CREATE USER '$DB_REPL_USER'@'%' IDENTIFIED BY '$DB_REPL_PASSWORD';
GRANT REPLICATION SLAVE ON *.* TO '$DB_REPL_USER'@'%';
FLUSH PRIVILEGES;"
mysql -e "$MYSQL_COMMANDS"

#unison -batch /var/www ssh://192.168.0.52//var/www -owner -group
#new_crontab="* * * * * unison -batch /var/www ssh://192.168.0.52//var/www &> /dev/null"
#current_crontab=$(crontab -l 2>/dev/null)
#echo "$current_crontab" > temp_crontab
#echo "$new_crontab" >> temp_crontab
#crontab temp_crontab
#rm temp_crontab
