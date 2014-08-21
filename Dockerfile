# nginx with confd
FROM ewoutp/docker-nginx-curl

# Install confd
ENV CONFD_VERSION 0.5.0

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64 -o /usr/local/bin/confd
RUN chmod 0755 /usr/local/bin/confd
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates
