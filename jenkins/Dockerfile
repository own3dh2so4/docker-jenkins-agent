FROM jenkins:2.46.2

ENV DOCKER_HOST 172.17.0.1:4243

USER root

RUN  set -e;                               \
     apt-get update;                       \
     apt-get install -y docker.io;

COPY plugins.txt /usr/share/jenkins

RUN  /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt | tr '\n' ' ')

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER jenkins