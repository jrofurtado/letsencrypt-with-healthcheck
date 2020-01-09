certbot certonly --standalone --preferred-challenges http --http-01-port 80 -n --agree-tos -m "jrofurtado@gmail.com" -d "$DOMAIN" \
  && cp "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" /volume/server.crt \
  && cp "/etc/letsencrypt/live/$DOMAIN/privkey.pem" /volume/server.key \
  && cat /volume/server.crt /volume/server.key > /volume/server.pem
