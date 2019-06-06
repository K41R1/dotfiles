#!/bin/sh

SPARK_URL=https://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-without-hadoop.tgz
SPARK_ARCHIVE=spark-2.4.3-bin-without-hadoop.tgz
SPARK_INSTALL_DIR=$HOME/apache
TMP_DIR=/tmp


echo -en '\E[37;32m' "\033[1m *************** SWITCH TO /tmp *************** \033[0m \n"
pushd $TMP_DIR
wget --show-progress $SPARK_URL

echo -en '\E[37;32m' "\033[1m *************** EXTRACT TO $HOME/apache *************** \033[0m \n"
tar zxvf $SPARK_ARCHIVE -C $SPARK_INSTALL_DIR
