#!/bin/sh

all() {
        for i in $OC1 $OC2 $OC3 $OC4 $OC5 $OC6
        do
                onos-secure-ssh -u sdn -p rocks $i
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