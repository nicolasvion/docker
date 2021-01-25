#!/usr/bin/env sh

while true
do
    # update ssh authorized_keys via configmap
    cat /root/.ssh-authorized/authorized_keys > /root/.ssh/authorized_keys
    sleep 60
done
