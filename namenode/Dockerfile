FROM hadoop-base:1.0.1

# All below ENVs can be overriden by "--env-file" or "-e" flags.
ENV DFS_REPLICATION=3
ENV HADOOP_TMP_DIR="/home/root/hdfs"
ENV FS_DEFAULTFS="localhost:9000"

# Start namenode.
RUN  hdfs namenode -format
ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

# Expose ports.
# Admin dashboard.
EXPOSE 9870
# HDFS.
EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
