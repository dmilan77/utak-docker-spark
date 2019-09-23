#!/usr/bin/env bash
export TAG=2.4.4-r2
export SPARK_VERSION=2.4.4
export LIVY_VERSION=0.6.0-incubating
docker build -t dmilan/utak-docker-spark . --build-arg SPARK_VERSION=${SPARK_VERSION}  --build-arg LIVY_VERSION=${LIVY_VERSION}
docker tag  dmilan/utak-docker-spark dmilan/utak-docker-spark:${TAG}