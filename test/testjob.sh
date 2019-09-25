# /opt/spark/examples/jars/spark-examples_2.11-2.4.4.jar
curl -X POST --data '{"file": "/opt/spark/examples/jars/spark-examples_2.11-2.4.4.jar", "className": "org.apache.spark.examples.SparkPi"}' \
-H "Content-Type: application/json" localhost:8998/batches
{"id":0,"state":"running","log":[]}