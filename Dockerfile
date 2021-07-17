# Install OS. 
FROM ubuntu:20.04
# Avoid OS setup questions.
ARG DEBIAN_FRONTEND=noninteractive 

# Install dependencies.
RUN apt-get update 
RUN apt-get install --fix-missing -y openjdk-8-jdk 
RUN apt-get install -y \
      pdsh \
      curl \
      net-tools \
      iputils-ping

# Export JAVA_HOME.      
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Install Hadoop.
ENV HADOOP_VERSION 3.3.1
# Using mirror download to speed up download process.
ENV HADOOP_URL https://mirror.downloadvn.com/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz 
RUN tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

# "logs" directory will be created by "hdfs namenode -format" if it has not created yet.
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs


# Export environment variables.
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

# Import Hadoop configurations.
COPY *.xml etc/hadoop/
COPY *.sh etc/hadoop/

# Enable localhost SSH.
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys
