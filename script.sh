#! /bin/bash

#Primo parametro passato deve essere il dominio da analizzare

DOMAIN=$1
WORDLIST=$2

echo "start amass"
amass enum -d $DOMAIN > amass_output.txt
echo "amass terminato"
echo "start dig"
while read -r word; do
	subdomain="${word}.${DOMAIN}"
	echo "checking $subdomain"
	#dig + short "$subdomain" > dig_output.txt
done <"$WORDLIST"
echo "finish dig"
