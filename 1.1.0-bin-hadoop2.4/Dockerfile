
# Inspired by these images:
# https://github.com/sequenceiq/docker-spark
# https://github.com/apache/spark/tree/master/docker


# For building this image, See https://github.com/GELOG/docker-ubuntu-java
FROM gelog/java:openjdk7


# Spark (1.1.0) binaries prebuilt
ENV SPARK_VERSION      1.1.0
ENV SPARK_BIN_VERSION  $SPARK_VERSION-bin-hadoop2.4
ENV SPARK_HOME         /usr/local/spark
ENV PATH               $PATH:$SPARK_HOME/bin


# Installing Spark for Hadoop
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_BIN_VERSION.tgz && \
    tar -zxf /spark-$SPARK_BIN_VERSION.tgz -C /usr/local/ && \
    ln -s /usr/local/spark-$SPARK_BIN_VERSION $SPARK_HOME && \
    rm /spark-$SPARK_BIN_VERSION.tgz


# Default action: show available commands on startup
CMD ["spark-submit"]

