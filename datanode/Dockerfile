FROM hungict2407/hadoop-base:1.0.0

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

# Dashboard port: 
EXPOSE 9864

EXPOSE 9866
EXPOSE 9867

ENTRYPOINT ["/entrypoint.sh"]
