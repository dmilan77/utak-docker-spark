#FROM ubuntu:disco-20190913
FROM debian:stretch-20190812
#FROM ubuntu:18.04
ARG SPARK_VERSION
ARG LIVY_VERSION

ENV SPARK_VERSION ${SPARK_VERSION}
ENV LIVY_VERSION ${LIVY_VERSION}
RUN apt update -y
RUN apt install wget curl software-properties-common  openjdk-8-jdk -y
RUN apt install unzip supervisor -y
RUN mkdir -p /opt
WORKDIR /opt
RUN curl  -OJL  https://www-us.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz 
RUN curl  -OJL  https://www-us.apache.org/dist/incubator/livy/$LIVY_VERSION/apache-livy-$LIVY_VERSION-bin.zip
RUN tar xf spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
RUN unzip apache-livy-$LIVY_VERSION-bin.zip
USER root
COPY .cachebust /opt/
RUN ln -s /opt/spark-${SPARK_VERSION}-bin-hadoop2.7 /opt/spark
RUN ln -s /opt/apache-livy-$LIVY_VERSION-bin /opt/livy
RUN mkdir /opt/livy/logs /opt/scripts
RUN mkdir -p /var/log/supervisor
ENV SPARK_HOME /opt/spark
RUN mkdir -p /opt/logs
RUN mkdir -p /opt/bin
RUN mkdir -p /opt/etc/supervisor/conf.d
COPY supervisor-conf/* /opt/etc/supervisor/conf.d/
COPY shell-scripts/* /opt/bin/
COPY livy-conf/* /opt/livy/conf/
RUN groupadd -r spark -g 1001 && useradd -r -u 1001 -g spark spark
RUN chown -R spark:spark /opt
USER spark
ENV SPARK_HOME=/opt/spark
#RUN rm $SPARK_HOME/jars/guava-14.0.1.jar
#ADD http://central.maven.org/maven2/com/google/guava/guava/23.0/guava-23.0.jar $SPARK_HOME/jars
#ADD https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar $SPARK_HOME/jars
#ADD http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar  $SPARK_HOME/jars/
#ADD http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar  $SPARK_HOME/jars/
RUN rm -rf /opt/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz
RUN rm -rf /opt/apache-livy-$LIVY_VERSION-bin.zip
CMD ["/opt/bin/run.sh"]
