#!/usr/bin/bash

# creating a syslog configuration file to redirect the info level logs to /var/log/my.log
sudo echo "*.info    /var/log/my.log" > /etc/rsyslog.d/mylog.conf

# we need to restart rsyslog to get reload our nylog.conf file

sudo systemctl restart rsyslog

