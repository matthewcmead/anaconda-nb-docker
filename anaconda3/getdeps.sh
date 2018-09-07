#!/usr/bin/env bash

#(cd software_dist && wget --quiet https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh)
(cd software_dist && wget https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh)
(cd bin && TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && curl -L https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini >tini)
