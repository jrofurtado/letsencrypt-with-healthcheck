PARAMS="-d $DOMAIN"
if [ -z "$EXTRADOMAIN" ]
then
else
  PARAMS="$PARAMS -d $EXTRADOMAIN"
fi
certbot certonly --standalone --preferred-challenges http --http-01-port 80 -n --agree-tos -m $EMAIL $PARAMS
cp "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" /volume/server.crt \
  && cp "/etc/letsencrypt/live/$DOMAIN/privkey.pem" /volume/server.key \
  && cat /volume/server.crt /volume/server.key > /volume/server.pem
if [ -z "$EXTRADOMAIN" ]
then
else
  cp "/etc/letsencrypt/live/$EXTRADOMAIN/fullchain.pem" /volume/extradomain.crt \
    && cp "/etc/letsencrypt/live/$EXTRADOMAIN/privkey.pem" /volume/extradomain.key \
    && cat /volume/extradomain.crt /volume/extradomain.key > /volume/extradomain.pem
fi