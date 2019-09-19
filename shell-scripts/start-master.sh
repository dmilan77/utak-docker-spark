#!/usr/bin/env bash
umask 0000
now=$(date +"%T")
echo "Container Start Time : $now" >> /tmp/spark-start.txt
/usr/bin/supervisord -n -c /opt/etc/supervisor/conf.d/supervisor-master.conf
