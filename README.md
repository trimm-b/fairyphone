# fairyphone
modified scripts based on https://www.instructables.com/Fairytale-Phone/

The idea of this steps are to start the phone1 executable at raspi startup time using a systemd service
instead of using the legacy /etc/rc.local file

## Steps to install:
1. become superuser 
```
sudo bash
```
2. backup your current /etc/rc.local
```
cp /etc/rc.local /etc/rc.local.backup
```
3. copy the files from this repo to the correspondig location on your raspi
4. make all new files executable except the mp3-files using: 
```
chmod a+x <file>
```
5. test the service
```
cd /etc/systemd/system
systemctl start fairyphone
```
```
ps waux | grep phone1
```
should now display something like 
```
root       466 99.9  0.8  23472  8028 ?        Rl   21:33  24:28 /usr/bin/python3 /opt/phone/software/phone1
root       641  0.0  0.0   7348   500 pts/0    S+   21:58   0:00 grep phone1
```
6. install the service, restart, test
```
cd /etc/systemd/system
systemctl enable fairyphone
```
restart the raspi using
```
sudo init 6
```
reconnect to the raspi.
execute
```
ps waux | grep phone1
```
this should display something like 
```
root       466 99.9  0.8  23472  8028 ?        Rl   21:33  24:28 /usr/bin/python3 /opt/phone/software/phone1
root       641  0.0  0.0   7348   500 pts/0    S+   21:58   0:00 grep phone1
```
in /tmp/phone1.log you can see the output of phone1

## If you already have mp3's and phone1 on youre raspi
1. become superuser 
```
sudo bash
```
2. backup your current /etc/rc.local
```
cp /etc/rc.local /etc/rc.local.backup
```
3. copy the files /etc/rc.local and /etc/systemd/system/fairyphone.service from this repo to the correspondig location on your raspi
4. copy /opt/phone/software/phone.sh from this repo to a  location of your choice on your raspi
5. Adjust the pathes in /etc/systemd/system/fairyphone.service. They must point to your phone.sh and its directory.
6. Adjust the path in phone.sh. It must point to your phone1 executable.
7. make all new files executable using:
```
chmod a+x <file>
```
8. test the service
```
cd /etc/systemd/system
systemctl start fairyphone
```
```
ps waux | grep phone1
```
should now display something like 
```
root       466 99.9  0.8  23472  8028 ?        Rl   21:33  24:28 /usr/bin/python3 /opt/phone/software/phone1
root       641  0.0  0.0   7348   500 pts/0    S+   21:58   0:00 grep phone1
```
9. install the service, restart, test
```
cd /etc/systemd/system
systemctl enable fairyphone
```
restart the raspi using
```
sudo init 6
```
reconnect to the raspi.
execute
```
ps waux | grep phone1
```
this should display something like 
```
root       466 99.9  0.8  23472  8028 ?        Rl   21:33  24:28 /usr/bin/python3 /opt/phone/software/phone1
root       641  0.0  0.0   7348   500 pts/0    S+   21:58   0:00 grep phone1
```
in /tmp/phone1.log you can see the output of phone1
