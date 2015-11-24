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

masters() {
	for i in $OC1 $OC5 $OC6
	do
        	client -h $i -u karaf "masters" > $INFOLOG_DIR/"$i"_masters_$(date +%F_%T)
	done
}

trace() {
	for i in $OC1 $OC5 $OC6
	do
		client -h $i -u karaf "log:set TRACE"
	done
}

info() {
    for i in $OC1 $OC5 $OC6
    do
        client -h $i -u karaf "log:set INFO"
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
masters)
	set -x
	masters
	;;
trace)
	set -x
	trace
	;;
info)
	set -x
	info
	;;
*)
	echo "usage:30 {masters|roles|devices|trace|info}"
esac
