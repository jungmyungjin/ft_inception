#!/bin/bash

TEMPLATE_SCRIPT_PATH='/mariaDB/script.sql.template'
SCRIPT_PATH='/mariaDB/script.sql'

if [ ! -f "$SCRIPT_PATH" ]; then
    echo "$TEMPLATE_SCRIPT_PATH exists."
		cat $TEMPLATE_SCRIPT_PATH | envsubst > $SCRIPT_PATH;
		# mysqld_safe --init-file $SCRIPT_PATH
		mysqld_safe --init-file $SCRIPT_PATH

else
		# mysqld_safe
		mysqld_safe
fi
