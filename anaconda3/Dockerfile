FROM centos:7 as builder

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
      
COPY software_dist/Anaconda3-4.4.0-Linux-x86_64.sh /anaconda.sh
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
&&  /bin/bash /anaconda.sh -b -p /opt/conda

FROM centos:7 as runner

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

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh

COPY --from=builder /opt/conda /opt/conda
COPY bin/tini /tini

RUN chmod 755 /tini

ENV PATH /opt/conda/bin:$PATH

ENTRYPOINT [ "/tini", "--" ]
CMD [ "/bin/bash" ]
