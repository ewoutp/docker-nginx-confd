# nginx with confd (and supervisord)
FROM ewoutp/docker-nginx-curl

# Install confd
ENV CONFD_VERSION 0.6.0-alpha3

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64 -o /usr/local/bin/confd
RUN chmod 0755 /usr/local/bin/confd
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

# Install supervisor
RUN mv /etc/mime.types /etc/nginx.mime.types
RUN apt-get update && apt-get install -y supervisor && apt-get clean
ADD ./supervisord.conf /etc/supervisord.conf
