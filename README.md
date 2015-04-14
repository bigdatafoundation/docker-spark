# Apache Spark

[![dockeri.co](http://dockeri.co/image/gelog/spark)](https://registry.hub.docker.com/u/gelog/spark/)

[![stars](https://img.shields.io/github/stars/apache/spark.svg) ![forks](https://img.shields.io/github/forks/apache/spark.svg) ![issues](https://img.shields.io/github/issues/apache/spark.svg) ](https://github.com/apache/spark)

## Supported tags and respective `Dockerfile` links
- [`1.2-bin-hadoop2.3`/Dockerfile](https://github.com/GELOG/docker-ubuntu-spark/blob/master/1.2-bin-hadoop2.3/Dockerfile)
- [`1.1-bin-hadoop2.4`/Dockerfile](https://github.com/GELOG/docker-ubuntu-spark/blob/master/1.1-bin-hadoop2.4/Dockerfile)
- [`1.1-bin-hadoop2.3`/Dockerfile](https://github.com/GELOG/docker-ubuntu-spark/blob/master/1.1-bin-hadoop2.3/Dockerfile)

## What is Spark ?
Apache Spark is a fast and general-purpose cluster computing system. It provides high-level APIs in Java, Scala and Python, and an optimized engine that supports general execution graphs. It also supports a rich set of higher-level tools including [Spark SQL](https://spark.apache.org/docs/latest/sql-programming-guide.html) for SQL and structured data processing, [MLlib](https://spark.apache.org/docs/latest/mllib-guide.html) for machine learning, [GraphX](https://spark.apache.org/docs/latest/graphx-programming-guide.html) for graph processing, and [Spark Streaming](https://spark.apache.org/docs/latest/streaming-programming-guide.html).

[https://spark.apache.org/docs/latest/](https://spark.apache.org/docs/latest/)

## What is Docker?
Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications. Consisting of Docker Engine, a portable, lightweight runtime and packaging tool, and Docker Hub, a cloud service for sharing applications and automating workflows, Docker enables apps to be quickly assembled from components and eliminates the friction between development, QA, and production environments. As a result, IT can ship faster and run the same app, unchanged, on laptops, data center VMs, and any cloud.

[https://www.docker.com/whatisdocker/](https://www.docker.com/whatisdocker/)

### What is a Docker Image?
Docker images are the basis of containers. Images are read-only, while containers are writeable. Only the containers can be executed by the operating system.

[https://docs.docker.com/terms/image/](https://docs.docker.com/terms/image/)

## Dependencies
* [Install Docker](https://docs.docker.com/installation/)

## Base Docker image

| Branch               | Base Image      | Description               |
| -------------------- | --------------- | ------------------------- |
| master               | [gelog/java:openjdk7](https://registry.hub.docker.com/u/gelog/java/) | Spark pre-built for Hadoop |
| spark-for-hadoop     | "             " | Spark pre-built for Hadoop (dev branch) |
| spark-from-source    | scala:2.10.4    | Spark built from source |

Note: currently the spark-from-source image takes quite a while to build, and generates 2.3 GB of virtual size.

The recommended branch for general use is **master**.

## How to use this image?

### Spark Master
    docker run -d --name spark-master -h spark-master -p 8080:8080 -p 7077:7077 \
    gelog/spark:1.2-bin-hadoop2.3 spark-class org.apache.spark.deploy.master.Master
### Spark Worker
    docker run -d --name spark-worker1 -h spark-worker1 --link=hdfs-namenode:hdfs-namenode --link=spark-master:spark-master \
    gelog/spark:1.2-bin-hadoop2.3 spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077
