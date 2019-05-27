#!/bin/sh
# this script require root privileges
if [[ $UID -ne 0 ]]; then
  echo -ne "MUST BE ROOT !! \n"
  exit 13
fi
JDK8_URL="http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz"
JDK12_URL="https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.tar.gz"
JDK_ARCHIVE="jdk.tar.gz"
INSTALL_DIR="/usr/lib/jvm"
echo -ne "choose a java version \n"
echo -ne "[1] jdk-8 (lts) \n"
echo -ne "[2] jdk-12 newer version \n"
read -r version
pushd /tmp
case version in
  1)
  JDK_ARCHIVE='jdk-8.tar.gz'
  wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $JDK8_URL -O $JDK_ARCHIVE
    ;;
  2)
  JDK_ARCHIVE='jdk-12.tar.gz'
  wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $JDK12_URL -O $JDK_ARCHIVE
    ;;
  *)
    echo -ne "please choose a version \n"
    exit 1
    ;;
esac
echo -ne "creating install dir /usr/lib/jvm \n"
mkdir -p $INSTALL_DIR
echo -ne "extracting java archive \n"
tar xvzf $JDK_ARCHIVE -C $INSTALL_DIR

echo -ne "setting JAVA_HOME ...\n"
SHELL=$(echo $SHELL | cut -d "/" -f4)

case $SHELL in
  zsh )
    echo -ne "\n\n export JAVA_HOME=$INSTALL_DIR/jdk " >> $HOME/.zshrc
    ;;
  bash )
    echo -ne "\n\n export JAVA_HOME=$INSTALL_DIR/jdk " >> $HOME/.bashrc
    ;;
esac

echo -ne "update PATH variable ... \n"
case $SHELL in
  zsh )
    echo -ne "\n\n export PATH=$PATH:$INSTALL_DIR/jdk " >> $HOME/.zshrc
    ;;
  bash )
    echo -ne "\n\n export PATH=$PATH:$INSTALL_DIR/jdk " >> $HOME/.bashrc
    ;;
esac
popd
