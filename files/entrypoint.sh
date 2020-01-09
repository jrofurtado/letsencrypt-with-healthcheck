sed s@'$CRONTAB_PERIOD'@"$CRONTAB_PERIOD"@ </crontab_template.txt >/crontab.txt
/usr/bin/crontab /crontab.txt
sh new-cert.sh
/usr/sbin/crond -f -l 8
