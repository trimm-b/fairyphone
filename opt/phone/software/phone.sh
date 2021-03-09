#!/bin/sh
/bin/systemctl list-units --type target > /tmp/services
echo hallo > /tmp/hallo
/usr/bin/python3 /opt/phone/software/phone1  > /tmp/phone1.log 2>&1

