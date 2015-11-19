#!/bin/sh

INFOLOG_DIR="/home/sdn/logs/onos-info"

roles() {
        for i in $OC1 $OC5 $OC6
        do
                client -h $i -u karaf "roles" > $INFOLOG_DIR/"$i"_roles_$(date +%F_%T)
        done
}

devices() {
        for i in $OC1 $OC5 $OC6
        do
                client -h $i -u karaf "devices" > $INFOLOG_DIR/"$i"_devices_$(date +%F_%T)
        done
}

master() {
	for i in $OC1 $OC5 $OC6
	do
        	client -h $i -u karaf "master" > $INFOLOG_DIR/"$i"_master_$(date +%F_%T)
	done
}

trace() {
	for i in $OC1 $OC5 $OC6
	do
		client -h $i -u karaf "log TRACE"
	done
}

case "$1" in
roles)
	set -x
	roles
	;;
devices)
	set -x
	devices
	;;
master)
	set -x
	master
	;;
trace)
	set -x
	trace
	;;
*)
	echo "usage:30 {master|roles|devices}"
esac
