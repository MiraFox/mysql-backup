FROM debian:jessie
MAINTAINER Ruzhentsev Alexandr noc@mirafox.ru

COPY scripts/ /usr/local/bin/

RUN apt-get update && apt-get -y upgrade && apt-get install -y sshpass mysql-client \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && chmod 755 /usr/local/bin/docker-entrypoint.sh

VOLUME /backup

CMD ["/usr/local/bin/docker-entrypoint.sh"]
