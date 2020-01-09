CN=$(openssl x509 -noout -subject -in /volume/server.pem | sed -n 's/^subject=CN = //p')
if [ $CN != $DOMAIN ]
then
  echo "Certificate CN $CN does not match $DOMAIN"
  exit 1
fi
if openssl x509 -checkend 432000 -noout -in /volume/server.pem
then
  exit 0
else
  echo "Certificate has expired or will do so within 5 days!"
  exit 1
fi