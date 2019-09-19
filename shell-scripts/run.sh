#!/usr/bin/env bash
if [ -z "$SPARK_MODE" ]
then
   echo "SPARK_MODE not set" >> /opt/logs/run.log 
else
   echo $SPARK_MODE >> /opt/logs/run.log 
   if [ $SPARK_MODE = "master" ]; then
       echo "executing /opt/start-master.sh" >> /opt/logs/run.log 
       /opt/bin/start-master.sh
   fi
   if [ $SPARK_MODE = "worker" ]; then
       echo "executing /opt/start-worker.sh" >> /opt/logs/run.log 
       /opt/bin/start-worker.sh
   fi
fi

