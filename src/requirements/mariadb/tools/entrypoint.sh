#!/bin/bash
set -e

echo "/$\0 = $0, /$\1 = $1"

if [ "$1" = 'mysqld_safe' ]; then
	TEMPLATE_SCRIPT_PATH='/mariaDB/script.sql.template'
	SCRIPT_PATH='/mariaDB/script.sql'
	echo "IN /$\0 = $0, /$\1 = $1"
	if [ ! -f "$SCRIPT_PATH" ]; then
	    echo "$TEMPLATE_SCRIPT_PATH exists."
			cat $TEMPLATE_SCRIPT_PATH | envsubst > $SCRIPT_PATH;
			exec mysqld_safe --init-file $SCRIPT_PATH
	fi
fi
exec "$@"
