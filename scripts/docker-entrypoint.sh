#!/bin/bash

if [[ -n "$DEBUG" ]]; then
  set -x
fi

DB_DUMP_INTERVAL=${DB_DUMP_INTERVAL:-1440}
DB_HOST=${DB_HOST:-127.0.0.1}
TIMEZONE=${TIMEZONE:-Europe/Moscow}

echo $TIMEZONE | tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

while true; do
    backup_date=`date +"%G-%m-%d_%H_%M_%S"`
    backup_file=/backup/$backup_date.sql.gz

    mysqldump -A -h $DB_HOST -u$DB_USER -p$DB_PASSWORD | gzip > $backup_file

    sshpass -p "$BACKUP_PASSWORD" scp  -o "StrictHostKeyChecking no" $backup_file $BACKUP_USER@$BACKUP_HOST:$BACKUP_DIR

    # rm -f $backup_file

    sleep $(($DB_DUMP_INTERVAL*60))
done
