FROM own3dh2so4/gradle-jenkins-slave:3.4.1
MAINTAINER David Garcia <david.garcia.alvarez.93@gmail.com>

ENV SBT_VERSION 0.13.8
ENV SBT_HOME /usr/local/sbt
ENV SCALA_VERSION 2.10.4
ENV SCALA_HOME /usr/local/scala-${SCALA_VERSION}
ENV PATH ${PATH}:${SCALA_HOME}/bin:${SBT_HOME}/bin

# Install Scala
## Piping curl directly in tar
RUN \
  wget "http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz" && \
  tar -xvzf scala-${SCALA_VERSION}.tgz  && \
  cp -a scala-${SCALA_VERSION}/* /usr/local && rm -rf scala-${SCALA_VERSION} && \
  echo >> /root/.bashrc && \
  echo -ne "- with scala $SCALA_VERSION\n" >> /root/.built

# Install sbt
RUN apk add --no-cache --update bash && \
    wget "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" && \
    tar -xvzf sbt-${SBT_VERSION}.tgz && \
    cp -a sbt/* /usr/local && rm -rf sbt && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built