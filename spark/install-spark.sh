#!/bin/sh

SPARK_URL=https://www-us.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
SPARK_ARCHIVE=spark-2.4.0-bin-hadoop2.7.tgz
SPARK_INSTALL_DIR=/opt
TMP_DIR=/tmp

if [[ $UID -ne 0 ]]; then
  echo -en '\E[45;32m' "\033[1m MUST BE ROOT (EACCESS) \033[0m \n"   # Green
  tput sgr0
  exit 13
fi

echo -en '\E[37;32m' "\033[1m *************** SWITCH TO /tmp *************** \033[0m \n"
tput sgr0
pushd $TMP_DIR
wget --show-progress $SPARK_URL

echo -en '\E[37;32m' "\033[1m *************** EXTRACT TO /opt *************** \033[0m \n"
tput sgr0
tar zxvf $SPARK_ARCHIVE -C $SPARK_INSTALL_DIR
