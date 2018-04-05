#!/bin/bash

set -e

VERSION="v0.1.8"

case "$OSTYPE" in
  darwin*)  OS="darwin" ;; 
  linux*)   OS="linux"  ;;
  *)        echo "Your operating system ('$OSTYPE') is not supported by Capstan. Exiting." && exit 1 ;;
esac

case "$HOSTTYPE" in
  x86_64*)  ARCH="amd64" ;;
  *)        echo "OSv only supports 64-bit x86. Exiting." && exit 1 ;;
esac

URL="http://osv.capstan.s3.amazonaws.com/capstan/${VERSION}/${OS}_${ARCH}/capstan"
DIR="$HOME/bin"

mkdir -p $DIR

echo "Downloading Capstan binary: $URL"

curl -# $URL > $DIR/capstan || exit

chmod u+x $DIR/capstan
