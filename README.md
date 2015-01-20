# docker-ubuntu-spark
Dockerfile for running Apache Spark on Ubuntu

## Building this image
git clone https://github.com/GELOG/docker-ubuntu-spark.git
cd docker-ubuntu-spark/
docker build --rm=true -t spark:1.1.0-bin-hadoop2.3 .
