FROM ubuntu:trusty
MAINTAINER Jeremy Chang <jeremychang@qnap.com>

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    iptables \
    apparmor

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && \
    apt-get purge -y lxc-docker && \
    apt-get upgrade -y && \
    apt-get install -y docker-engine=1.8.2-0~trusty && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Docker Compose
RUN curl -s -L https://github.com/docker/compose/releases/latest | \
    egrep -o '/docker/compose/releases/download/[0-9.]*/docker-compose-Linux-x86_64' | \
    wget --base=http://github.com/ -i - -O /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    /usr/local/bin/docker-compose --version

VOLUME /var/lib/docker
ENV LOG=file

ADD entry.sh /
ENTRYPOINT ["/entry.sh"]
CMD []
