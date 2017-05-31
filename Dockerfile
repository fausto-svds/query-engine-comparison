FROM cloudera/quickstart

COPY hive.ddl.sql /
COPY setup.sh /

EXPOSE 80 4040 7180 8888 10000

ENTRYPOINT exec /setup.sh
