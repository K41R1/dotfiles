#!/bin/sh
# this script assume that you have java already installed

HADOOP_VERSION=3.2.0
HADOOP=hadoop-$HADOOP_VERSION
HADOOP_URL=https://archive.apache.org/dist/hadoop/core/$HADOOP/$HADOOP.tar.gz
HADOOP_INSTALL_DIR=$HOME/opt/
HADOOP_HOME=$HADOOP_INSTALL_DIR/$HADOOP
HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
HADOOP_CONF_TEMPLATE=$(pwd)/etc/hadoop

pushd /tmp
wget $HADOOP_URL --progress=bar:mega
tar xvzf $HADOOP.tar.gz -C $HADOOP_INSTALL_DIR
echo -en "--- DELETE $HADOOP.tar.gz ---\n"
rm -f $HADOOP.tar.gz
popd
pushd $HADOOP_INSTALL_DIR/$HADOOP
echo -en "--- COPYING TEMPLATE CONFIG ---\n"
cp -r --force --verbose $HADOOP_CONF_TEMPLATE/* $HADOOP_CONF_DIR
popd

echo -ne "Configure $HADOOP \n"
cp .hadooprc $HOME/
SHELL=$(echo $SHELL | cut -d "/" -f4)

case $SHELL in
  zsh )
    echo -ne "if [[ -f .hadooprc ]]; then \n source .hadooprc \n fi" >> $HOME/.zshrc
    ;;
  bash )
    echo -ne "if [[ -f .hadooprc ]]; then \n source .hadooprc \n fi" >> $HOME/.bashrc
    ;;
esac

# TODO: generate ssh keys and test connection
