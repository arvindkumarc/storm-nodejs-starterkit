FROM anapsix/alpine-java

ENV MAVEN_VERSION="3.3.3" \
    M2_HOME=/usr/lib/mvn

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
  apk --update add nodejs nodejs-dev ca-certificates wget && \
  cd /tmp && \
  wget "http://ftp.unicamp.br/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
  tar -zxvf "apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
  mv "apache-maven-$MAVEN_VERSION" "$M2_HOME" && \
  ln -s "$M2_HOME/bin/mvn" /usr/bin/mvn && \
  apk del wget && \
  rm /tmp/* /var/cache/apk/*

WORKDIR /myapp

COPY . /myapp

