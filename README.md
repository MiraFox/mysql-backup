## Описание

Это Dockerfile, позволяющие собрать образ Docker для создания резервных копий баз данных MySQL.

## Репозиторий Git

Репозиторий исходных файлов данного проекта: [https://github.com/MiraFox/mysql-backup](https://github.com/MiraFox/mysql-backup)

## Репозиторий Docker Hub

Расположение образа в Docker Hub: [https://hub.docker.com/r/mirafox/mysql-backup/](https://hub.docker.com/r/mirafox/mysql-backup/)

## Использование Docker Hub

```
sudo docker pull mirafox/mysql-backup
```

## Доступные параметры конфигурации

 - **DB_HOST**: хост или IP сервера MySQL, по умолчанию 127.0.0.1
 - **DB_USER**: имя пользователя MySQL, по умолчанию root
 - **DB_PASSWORD**: пароль пользователя MySQL
 - **DUMP_INTERVAL**: интервал создания резервных копий, в минутах, по умолчанию 1440 минут (раз в сутки)
 - **DUMP_BEGIN**: интервал времени, через который после запуска контейнера будет выполнена первая резервная копия, по умолчанию установлено 15 минут
 - **DUMP_PREFIX**: префикс имени архива резервной копии, по умолчанию 'db_'
 - **BACKUP_USER**: имя пользователя на удаленном сервере для сохранения резервной копии (необходимо доступ по SSH)
 - **BACKUP_PASSWORD**: пароль пользователя на удаленном сервере для сохранения резервной копии
 - **BACKUP_HOST**: хост или IP удаленного сервера
 - **BACKUP_DIR**: директория для сохранения резервной копии на удаленном сервере
 - **TIMEZONE**: временная зона контейнера, по умолчанию Europe/Moscow

#### Примеры использования

Загрука резервной копии на удаленный сервер по SSH:

```
sudo docker run -d \
    -e 'DB_USER=user_db' \
    -e 'DB_PASSWORD=NNNN' \
    -e 'DUMP_INTERVAL=240' \
    -e 'DUMP_PREFIX=docker1_' \
    -e 'BACKUP_USER=dockerbackup' \
    -e 'BACKUP_PASSWORD=NNNN' \
    -e 'BACKUP_HOST=192.168.1.100' \
    -e 'BACKUP_DIR=/home/dockerbackup/dump' \
    mirafox/mysql-backup

```

Сохранение резервных копий на локальном хранилище:

```
sudo docker run -d \
    --link mymysql:mysql \
    -v /home/username/sitename/dump/:/backup/ \
    -e 'DB_HOST=mysql' \
    -e 'DB_PASSWORD=MysqlRootPass' \
    mirafox/mysql-backup
```
