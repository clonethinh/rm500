chmod 777 /usrdata/simpleadmin/www/
wget -c https://raw.githubusercontent.com/clonethinh/rm500/main/www/atcommander.html /usrdata/simpleadmin/www/

wget -c https://raw.githubusercontent.com/clonethinh/rm500/main/www/speedtest.html /usrdata/simpleadmin/www/

wget -c https://raw.githubusercontent.com/clonethinh/rm500/main/www/bandlock.html /usrdata/simpleadmin/www/

wget -c https://raw.githubusercontent.com/clonethinh/rm500/main/www/ttl.html /usrdata/simpleadmin/www/

wget -c https://raw.githubusercontent.com/clonethinh/rm500/main/www/sms.html /usrdata/simpleadmin/www/


wget -c https://raw.githubusercontent.com/clonethinh/rm500/main/www/index.html /usrdata/simpleadmin/www/

cd /usrdata/simpleadmin/www
wget -c linkgithub

rm -rf index.html
rm -rf receive.php
rm -rf send.php
rm -rf sms.html
rm -rf bandlock.html
rm -rf atcommander.html

rm -rf speedtest.html

rm -rf ttl.html
