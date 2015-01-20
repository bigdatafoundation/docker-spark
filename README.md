# docker-ubuntu-spark
Dockerfile for running Apache Spark on Ubuntu

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
