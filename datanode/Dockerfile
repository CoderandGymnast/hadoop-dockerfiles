FROM hadoop-base:1.0.1


# All below ENVs can be overriden by "--env-file" or "-e" flags.
ENV DFS_REPLICATION=3
ENV HADOOP_TMP_DIR="/home/root/hdfs"
ENV FS_DEFAULTFS="localhost:9000"

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

# Dashboard port: 
EXPOSE 9864

EXPOSE 9866
EXPOSE 9867

ENTRYPOINT ["/entrypoint.sh"]
