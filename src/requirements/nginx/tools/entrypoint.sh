#!/bin/bash

TEMPLATE_SCRIPT_PATH='/nginx_workdir/defualt.conf.template'
HOME_COPY='/nginx_workdir/defualt.conf'
SCRIPT_PATH='/etc/nginx/sites-available/default'

if [ ! -f "$HOME_COPY" ]; then
    echo "$HOME_COPY (home copy) exists."
		cat $TEMPLATE_SCRIPT_PATH | envsubst '${DOMAIN_NAME}'> $HOME_COPY;
		cp $HOME_COPY $SCRIPT_PATH
fi

nginx -g "daemon off;"
