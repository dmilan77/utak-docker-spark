#!/usr/bin/env bash
set +x
export SPARK_VERSION=2.4.4
export LIVY_VERSION=0.6.0-incubating
export GCR_PROJECT_ID=utak-236419
date > .cachebust 
docker build -t dmilan/utak-docker-spark . --build-arg SPARK_VERSION=${SPARK_VERSION}  --build-arg LIVY_VERSION=${LIVY_VERSION} -f Dockerfile
# docker tag  dmilan/utak-docker-spark dmilan/utak-docker-spark:${TAG}
# docker tag  dmilan/utak-docker-spark gcr.io/${GCR_PROJECT_ID}/utak-docker-spark
# docker tag gcr.io/${GCR_PROJECT_ID}/utak-docker-spark gcr.io/${GCR_PROJECT_ID}/utak-docker-spark:${TAG}
# docker push gcr.io/${GCR_PROJECT_ID}/utak-docker-spark:${TAG}