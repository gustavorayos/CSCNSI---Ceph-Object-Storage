#!/bin/bash                                                                                                                                                                                
d=`date +"%d"`
m=`date +"%m"`
y=`date +"%y"`
#scp -P 148 evan@cscnsi.nmc-probe.org:/home/share/celadon_bak_*.tar.gz ./
scp -i ~/.ssh/id_rsa -P 148 evan@cscnsi.nmc-probe.org:/home/share/celadon_bak_$m-$d-$y.tar.gz ./
# Remove the previous backup if the current backup worked                                                                                                                                  
if [ "$?" -eq 0 -a -f "celadon_bak_$m-$d-$y.tar.gz" ]
then
	if [ -a "celadon_bak_$m-$(($d-2))-$y.tar.gz" ]
	then
	    echo "--Removed old backup: celadon_bak_$m-$(($d-2))-$y.tar.gz--"
	    rm celadon_bak_$m-$(($d-2))-$y.tar.gz
	else
		echo "--celadon_bak_$m-$(($d-2))-$y.tar.gz does not exist--"
		echo "--These backups do exist in $PWD--"
		ls celadon_bak*
	fi
fi

