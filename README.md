# mysql-backup



 - **DB_HOST**: хост или IP сервера MySQL, по умолчанию 127.0.0.1
 - **DB_USER**: имя пользователя MySQL
 - **DB_PASSWORD**: пароль пользователя MySQL
 - **DB_DUMP_INTERVAL**: интервал создания резервных копий, в минутах, по умолчанию 1440 минут (раз в сутки)
 - **BACKUP_USER**: имя пользователя на удаленном сервере для сохранения резервной копии (необходимо доступ по SSH)
 - **BACKUP_PASSWORD**: пароль пользователя на удаленном сервере для сохранения резервной копии
 - **BACKUP_HOST**: хост или IP удаленного сервера
 - **BACKUP_DIR**: директория для сохранения резервной копии на удаленном сервере
 - **TIMEZONE**: временная зона контейнера, по умолчанию Europe/Moscow


```
sudo docker run -d \
    -e 'DB_USER=user_db' \
    -e 'DB_PASSWORD=NNNN' \
    -e 'DB_DUMP_INTERVAL=240' \
    -e 'BACKUP_USER=dockerbackup' \
    -e 'BACKUP_PASSWORD=NNNN' \
    -e 'BACKUP_HOST=192.168.1.100' \
    -e 'BACKUP_DIR=/home/dockerbackup/dump' \
    mirafox/mysql-backup

```
