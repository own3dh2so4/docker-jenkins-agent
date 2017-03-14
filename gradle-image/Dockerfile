FROM own3dh2so4/java-jenkins-slave:openjdk8
MAINTAINER David Garcia <david.garcia.alvarez.93@gmail.com>


ENV IVY_HOME /cache
ENV GRADLE_VERSION 3.4.1
ENV GRADLE_HOME /usr/local/gradle
ENV PATH ${PATH}:${GRADLE_HOME}/bin
ENV GRADLE_USER_HOME /gradle

# Install gradle
WORKDIR /usr/local
RUN curl  -jksSL https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip -O && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle && \
    echo -ne "- with Gradle $GRADLE_VERSION\n" >> /root/.built

RUN apk update && apk add libstdc++ && rm -rf /var/cache/apk/*

RUN /usr/bin/ssh-keygen -A &&       \
         adduser -D -u 1000 -h /home/jenkins -s /bin/sh jenkins &&       \
         echo 'jenkins:jenkins' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]