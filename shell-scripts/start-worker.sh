#!/usr/bin/env bash
now=$(date +"%T")
echo "Container Start Time : $now" >> /tmp/spark-start.txt
if [ -z "$SPARK_MASTER_URL" ]
then
   echo "SPARK_MASTER_URL not set" >> /opt/logs/run.log
else
   sed -i "s#{{SPARK_MASTER_URL}}#$SPARK_MASTER_URL#" /opt/etc/supervisor/conf.d/supervisor-worker.conf
/usr/bin/supervisord -n -c /opt/etc/supervisor/conf.d/supervisor-worker.conf
fi
