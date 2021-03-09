# fairyphone
modified scripts based on https://www.instructables.com/Fairytale-Phone/

The idea of this steps are to start the phone1 executable using a systemd service
instead of using the legacy /etc/rc.local file

Steps to install:
1. become superuser 
```
sudo bash
```
2. backup your current /etc/rc.local
```
cp /etc/rc.local /etc/rc.local.backup
```
3. copy the files in this repo to the correspondig location on your raspi
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

