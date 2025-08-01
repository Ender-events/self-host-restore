#!/bin/sh -e

echo "do restore"

if [ "${restore_file:-1}" -eq 1 ]; then
  restic restore latest --target / --path '/mnt/nextcloud'
  restic restore latest --target / --path '/tmp/nextcloud_pgsql.bak'
fi

[ "${restore_db:-1}" -eq 1 ] && psql < /tmp/nextcloud_pgsql.bak

echo "restore done"
