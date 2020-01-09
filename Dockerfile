FROM alpine:latest
LABEL maintainer "jrofurtado@gmail.com"
CMD sh /entrypoint.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US.UTF-8' TERM='xterm'
ENV CRONTAB_PERIOD='0 0 1 * *' DOMAIN='mydomain.com'
RUN apk add --no-cache nodejs dcron certbot openssl
HEALTHCHECK --interval=30s --timeout=3s --start-period=30s --retries=3 CMD /healthcheck.sh
COPY files/ /
