#!/usr/bin/bash

# configure rsyslog to send ssh logs to /var/log/ssh.log
# & stop to prevent further processing of the log message. just to prevent dublicate log messages.
sudo cat <<EOF > /etc/rsyslog.d/ssh.conf
if \$PROGRAMNAME == 'sshd' then /var/log/ssh.log
& stop
EOF

sudo systemctl restart rsyslog


# log rotation, happens daily to ssh.log, happens daily, keep 10 rotated files only, if size 1 Mega force rotate,
# compress for compressing old rotated ssh logs to save disk space, missingok for not issuing an error if the file was not found.
# Notifempty=don't rotate if file was empty.
# create 640 root adm= the created log file will have 640 permission and owned by root
# after rotation, restart rsyslog to it starts writing on the new file

sudo cat <<EOF > /etc/logrotate.d/ssh
/var/log/ssh.log {
    daily
    rotate 10
    size 1M
    compress
    missingok
    notifempty
    create 640 root adm
    postrotate
        /bin/systemctl reload rsyslog.service > /dev/null 2>&1 || true
    endscript
}
EOF
