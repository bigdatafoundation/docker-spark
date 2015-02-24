# Supported tags and respective `Dockerfile` links
- [`1.0.1-bin-hadoop2.3`/Dockerfile](https://github.com/GELOG/docker-ubuntu-spark/tree/1.0.1-bin-hadoop2.3/Dockerfile)


# docker-ubuntu-spark
Dockerfile for running Apache Spark on Ubuntu

## Branches

| Branch               | Base Image      | Description               |
| -------------------- | --------------- | ------------------------- |
| master               | java:oraclejdk7 | Spark pre-built for Hadoop |
| spark-for-hadoop     | "             " | Spark pre-built for Hadoop (dev branch) |
| spark-from-source    | scala:2.10.4    | Spark built from source |

Note: currently the spark-from-source image takes quite a while to build, and generates 2.3 GB of virtual size.

The recommended branch for general use is **master**.


## Building this image
```
git clone https://github.com/GELOG/docker-ubuntu-spark.git
cd docker-ubuntu-spark/
docker build --rm=true -t spark:1.1.0-bin-hadoop2.3 .
```

## Running this image in a container

### Spark Master
Starts the spark master in detached mode (daemon).
```
docker run -d -h spark-master --name spark-master  spark:1.1.0-bin-hadoop2.3  /usr/local/spark/bin/spark-class org.apache.spark.deploy.master.Master
```

### Spark Worker
```
docker run -d -h spark-worker-01 --name spark-worker-01   spark:1.1.0-bin-hadoop2.3  /usr/local/spark/bin/spark-class org.apache.spark.deploy.worker.Worker  spark://spark-master:7077
```
