
# Inspired by these images:
# https://github.com/sequenceiq/docker-spark
# https://github.com/apache/spark/tree/master/docker


# For building this image, See https://github.com/GELOG/docker-ubuntu-scala
FROM scala:2.10.4


# Environment variables
ENV SPARK_VERSION      1.1.0
ENV SPARK_HOME         /usr/local/spark
ENV PATH               $PATH:$SPARK_HOME/bin


# Install Git (required to build Spark)
# FIXME: The git package in Ubuntu installs a bunch of packages 
# (git-man libedit2 liberror-perl libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxext6 libxmuu1 openssh-client patch rsync xauth)
# TODO: Find an alternate way to install git or Spark
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*


# Building Spark from source
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VERSION.tgz && \
    tar -zxf /spark-$SPARK_VERSION.tgz -C /usr/local/ && \
    rm /spark-$SPARK_VERSION.tgz && \
    ln -s /usr/local/spark-$SPARK_VERSION $SPARK_HOME
RUN cd $SPARK_HOME && \
    sbt/sbt assembly
# FIXME: Sparks calls sbt/sbt instead of the sbt command from our 

# TODO: WARNING: this Dockerfile currently generates an image of 2.313 GB (virtual size)
# TODO: Improvements needs to be done.

# Default action: show available commands on startup
CMD ["spark-submit"]

