#!/bin/bash
file=$$.tmp
tcpdump -l icmp | \
grep --line-buffered -Po "(?<=length )[0-9]+" |\
while IFS='\n' read;
	do byte=$(bc <<< "ibase=10;obase=16; $((REPLY-=8))");
	echo -n "$byte" | tee -a $file; 
done
xxd -r -p $file > output$$.bin
file output$$.bin

