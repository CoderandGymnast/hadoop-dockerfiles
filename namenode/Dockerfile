FROM hungict2407/hadoop-base:1.0.0

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
