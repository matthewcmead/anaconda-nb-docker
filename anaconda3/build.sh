#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ ! -f software_dist/Anaconda3-4.4.0-Linux-x86_64.sh ]; then
  ./getdeps.sh
fi
docker build -f Dockerfile.base -t matthewcmead/anaconda-nb-docker-centos7 .
docker run -it --rm -v "$DIR":/project matthewcmead/anaconda-nb-docker-centos7 /project/getpips.sh
docker build -t matthewcmead/anaconda-nb-docker-tensorflow-centos7 .

