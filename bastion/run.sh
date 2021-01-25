#!/usr/bin/env sh

# get ssh authorized_keys
/root/update-keys.sh &

# fix home permission (pb with nfs-utils)
chown root: /root
chmod -R 700 /root

# launch sshd
/usr/sbin/sshd -D -E /var/log/auth.log
