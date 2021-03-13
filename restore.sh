#!/bin/sh -e

echo "do restore"

restic restore latest --target / --path '/mnt/nextcloud'
restic restore latest --target / --path '/tmp/nextcloud_pgsql.bak'

psql < /tmp/nextcloud_pgsql.bak

echo "restore done"
