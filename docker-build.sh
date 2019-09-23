#!/usr/bin/env bash
export TAG=2.4.4-r2
docker build -t dmilan/utak-docker-spark . --build-arg SPARK_VERSION=2.4.4  --build-arg LIVY_VERSION=0.6.0-incubating
docker tag  dmilan/utak-docker-spark dmilan/utak-docker-spark:${TAG}