#!/bin/bash

set -eu

if [[ "$#" -ne 4 ]]; then
	echo "Usage: login.sh username groupname uid gid"
	exit 1
fi

uname=$1
gname=$2
uid=$3
gid=$4
shift 4

if [[ ! -f /etc/login-ran ]]; then
	groupadd $gname -g $gid
	useradd $uname -g $gid -G sudo -m -s /bin/bash -u $uid
	touch /etc/login-ran
fi

exec gosu $uname:$gname bash -c 'trap "exit 0" SIGTERM; sleep infinity & wait'
