#!/usr/bin/env bash
if [ -z "$SPARK_MODE" ]
then
   echo "SPARK_MODE not set" 
else
   echo $SPARK_MODE 
   if [ $SPARK_MODE = "master" ]; then
       echo "executing /opt/bin/start-master.sh" 
       /opt/bin/start-master.sh
   fi
   if [ $SPARK_MODE = "worker" ]; then
       echo "executing /opt/bin/start-worker.sh" 
       /opt/bin/start-worker.sh
   fi
fi

