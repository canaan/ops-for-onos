#!/bin/sh

INFOLOG_DIR="/home/sdn/logs/onos-info"
LOG=$ONOS_INSTALL_DIR/$KARAF_DIST/instances/$instance/data/log/karaf.log

all() {
        for i in $OC1 $OC2 $OC3 $OC4 $OC5 $OC6
        do
		ssh -t $i "cat  /opt/onos/apache-karaf-3.0.5/data/log/karaf.log" \
		 > $INFOLOG_DIR/"$i"_karaf-log_$(date +%F_%T)
        done
}

case "$1" in

all)
        set -x
        all
        ;;
*)
        echo "usage:30 {all}"
esac
