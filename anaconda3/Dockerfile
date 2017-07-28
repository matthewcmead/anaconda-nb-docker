FROM centos:7

MAINTAINER matt@matthewcmead.com

ENV LANG=en_US.utf8 LC_ALL=en_US.utf8

RUN \
    yum install -y \
      wget \
      bzip2 \
      ca-certificates \
      glib2 \
      libXext \
      libSM \
      libXrender \
      git \
      mercurial \
      subversion \
      curl \
      grep \
      sed \
&& \
    yum clean all
      
  
#RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
#    libglib2.0-0 libxext6 libsm6 libxrender1 \
#    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

RUN \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini" > /tini && chmod 755 /tini

ENV PATH /opt/conda/bin:$PATH

ENTRYPOINT [ "/tini", "--" ]
CMD [ "/bin/bash" ]
