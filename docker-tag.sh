#!/usr/bin/env bash
set +x
export TAG=2.4.4-r2.3
export SPARK_VERSION=2.4.4
export LIVY_VERSION=0.6.0-incubating
export GCR_PROJECT_ID=utak-236419
echo "docker tag  dmilan/utak-docker-spark gcr.io/${GCR_PROJECT_ID}/utak-docker-spark"
docker tag  dmilan/utak-docker-spark gcr.io/${GCR_PROJECT_ID}/utak-docker-spark
echo "docker tag gcr.io/${GCR_PROJECT_ID}/utak-docker-spark gcr.io/${GCR_PROJECT_ID}/utak-docker-spark:${TAG}"
docker tag gcr.io/${GCR_PROJECT_ID}/utak-docker-spark gcr.io/${GCR_PROJECT_ID}/utak-docker-spark:${TAG}
echo "docker push gcr.io/${GCR_PROJECT_ID}/utak-docker-spark"
docker push gcr.io/${GCR_PROJECT_ID}/utak-docker-spark
echo "docker push gcr.io/${GCR_PROJECT_ID}/utak-docker-spark:${TAG}"
docker push gcr.io/${GCR_PROJECT_ID}/utak-docker-spark:${TAG}
