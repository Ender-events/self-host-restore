#!/bin/sh -e

echo "do restore"

[ "${restore_file:-1}" -eq 1 ] && restic restore latest --target / --path '/mnt/nextcloud'

if [ "${restore_db:-1}" -eq 1 ]; then
  echo "restore db"
  restic restore latest --target / --path '/tmp/nextcloud_pgsql.bak'
  psql < /tmp/nextcloud_pgsql.bak
fi

echo "restore done"
