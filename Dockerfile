FROM        alpine:latest
MAINTAINER  Natsui31 "gwendoline.boirelle@gmail.com"
ENV REFRESHED_AT 2016-04-17

# Update the package repository and install applications
RUN apk add --update varnish && rm -rf /var/cache/apk/*

# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      128m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

VOLUME ["/var/lib/varnish", "/etc/varnish"]

EXPOSE 80
COPY ./varnish.sh /
RUN chmod a+x /varnish.sh
ENTRYPOINT ["/varnish.sh"]
