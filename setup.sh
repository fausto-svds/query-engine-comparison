#! /usr/bin/env bash

# Extract data

# HTML parser & wget installation
#yum install -y go wget
#export GOPATH=/go
#mkdir -p $GOPATH
#go get github.com/ericchiang/pup
#PATH=$GOPATH/bin:$PATH
#URL=`curl -L https://goo.gl/CAUIEE | pup 'a.ic-btn attr{href}'`
#wget ${URL}

# NOTE: /data needs to be owned by user running Docker
tar xvzf /data/*.tar.gz -C /data/
mv /data/**/*.csv /data/

DAEMONS="\
    mysqld \
    cloudera-quickstart-init"

if [ -e /var/lib/cloudera-quickstart/.kerberos ]; then
    DAEMONS="${DAEMONS} \
        krb5kdc \
        kadmin"
fi

if [ -e /var/lib/cloudera-quickstart/.cloudera-manager ]; then
    DAEMONS="${DAEMONS} \
        cloudera-scm-server-db \
        cloudera-scb-server \
        cloudera-scm-server-db"
else
    DAEMONS="${DAEMONS} \
        zookeeper-server \
        hadoop-hdfs-datanode \
        hadoop-hdfs-journalnode \
        hadoop-hdfs-namenode \
        hadoop-hdfs-secondarynamenode \
        hadoop-httpfs \
        hadoop-mapreduce-historyserver \
        hadoop-yarn-nodemanager \
        hadoop-yarn-resourcemanager \
        hive-metastore \
        hive-server2 \
        spark-history-server \
        hue \
        impala-state-store \
        solr-server \
        impala-catalog \
        impala-server"
fi

for daemon in ${DAEMONS}; do
    sudo service ${daemon} start
done

for subdirectory in "orders" "products" "order_products__prior"
do
    hadoop fs -mkdir -p /user/cloudera/instacart/${subdirectory}
    hadoop fs -put /data/${subdirectory}.csv /user/cloudera/instacart/${subdirectory}/${subdirectory}.csv
done

hive -f /hive.ddl.sql
/formats.sh

exec bash
