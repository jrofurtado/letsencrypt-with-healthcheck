# letsencrypt-with-healthcheck

# Volumes
/volume dir should be a volume and should contain the fullchain certificate *server.crt* and key *server.key*

If server.crt changes nghttpx will reload the certificate

# Environment variables
* PARAMS extra nghttx arguments

# docker-compose example
~~~~
version: '3'

volumes:
  lb_data:
    driver: local

services:
  myservice:
    ...
  le:
    image: jrofurtado/letsencrypt-with-healthcheck:1.1.0
    volumes: 
      - lb_data:/volume
    environment:
      CRONTAB_PERIOD: '1 1 * * 1'
      PARAMS: '-m name@email.com -d domain1.org -d domain2.org'
