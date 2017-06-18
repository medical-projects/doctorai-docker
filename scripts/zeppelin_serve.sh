#!/usr/bin/env bash
source /etc/profile
source /etc/bashrc

/usr/bin/sudo -i -u zeppelin /usr/local/zeppelin/bin/zeppelin-daemon.sh start

sleep 3 # wait for the files creating...
tail -f /usr/local/zeppelin/logs/*