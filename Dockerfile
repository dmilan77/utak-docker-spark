FROM debian:stretch-20190812
RUN apt update -y
RUN apt install wget curl software-properties-common  openjdk-8-jdk -y
RUN apt install unzip supervisor -y
RUN mkdir -p /opt
WORKDIR /opt
RUN wget https://www-us.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
RUN wget https://www-us.apache.org/dist/incubator/livy/0.6.0-incubating/apache-livy-0.6.0-incubating-bin.zip
RUN tar xf spark-2.4.4-bin-hadoop2.7.tgz
RUN unzip apache-livy-0.6.0-incubating-bin.zip
RUN ln -s /opt/spark-2.4.4-bin-hadoop2.7 /opt/spark
RUN ln -s /opt/apache-livy-0.6.0-incubating-bin /opt/livy
RUN mkdir /opt/livy/logs /opt/scripts
RUN mkdir -p /var/log/supervisor
ENV SPARK_HOME /opt/spark
RUN mkdir -p /opt/logs
RUN mkdir -p /opt/bin
RUN mkdir -p /opt/etc/supervisor/conf.d
COPY supervisor-conf/* /opt/etc/supervisor/conf.d/
COPY shell-scripts/* /opt/bin/
#ENV SPARK_MODE master
CMD ["/opt/bin/run.sh"]
