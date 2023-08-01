#!/bin/bash
cron && tail -f /var/log/cron.log &
nginx -g 'daemon off;'
wait -n
exit $?
