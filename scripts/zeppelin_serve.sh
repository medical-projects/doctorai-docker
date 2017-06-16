#!/usr/bin/env bash
source /etc/profile
source /etc/bashrc

/usr/bin/sudo -i -u zeppelin /usr/local/zeppelin/bin/zeppelin-daemon.sh start
