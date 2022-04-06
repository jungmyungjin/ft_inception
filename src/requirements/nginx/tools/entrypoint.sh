#!/bin/bash
set -e

TEMPLATE_SCRIPT_PATH='/nginx_workdir/defualt.conf.template'
HOME_COPY='/nginx_workdir/defualt.conf'
SCRIPT_PATH='/etc/nginx/sites-available/default'

if [ "$1" = 'nginx' ]; then
	if [ ! -f "$HOME_COPY" ]; then
			cat $TEMPLATE_SCRIPT_PATH | envsubst '${DOMAIN_NAME}'> $HOME_COPY;
			cp $HOME_COPY $SCRIPT_PATH
	fi
fi
exec "$@"