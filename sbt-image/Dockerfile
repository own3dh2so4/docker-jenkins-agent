FROM own3dh2so4/gradle-jenkins-slave:3.4.1
MAINTAINER David Garcia <david.garcia.alvarez.93@gmail.com>

ENV SBT_VERSION 0.13.8
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Install sbt
RUN apk add --no-cache --update bash && \
    wget "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" && \
    tar -xvzf sbt-${SBT_VERSION}.tgz && \
    cp -a sbt/* /usr/local && rm -rf sbt && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built