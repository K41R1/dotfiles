#!/bin/sh
HADOOP_VERSION=3.2.0
HADOOP=hadoop-$HADOOP_VERSION
HADOOP_URL=https://archive.apache.org/dist/hadoop/core/$HADOOP/$HADOOP.tar.gz
HADOOP_INSTALL_DIR=$HOME/opt/
HADOOP_CONF_TEMPLATE=$(pwd)/etc/hadoop


wget $HADOOP_URL --progress=bar:mega
