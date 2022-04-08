#!/bin/bash
set -e


if [ "$1" = 'mysqld_safe' ]; then
	TEMPLATE_SCRIPT_PATH='/mariaDB/script.sql.template'
	SCRIPT_PATH='/mariaDB/script.sql'
	if [ ! -f "$SCRIPT_PATH" ]; then
			cat $TEMPLATE_SCRIPT_PATH | envsubst > $SCRIPT_PATH;
			exec mysqld_safe --init-file $SCRIPT_PATH
	fi
fi
exec "$@"
