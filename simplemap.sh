#!/bin/bash
read -sp "Voer IP adres in : " ip

echo -e "\nYour input is $ip"
    # check if ip is online
    if ping -c 1 "$ip" | grep "from" >/dev/null; then
    	echo "-------------------"$ip" is online... Starting nmap scan-----------------"
        sudo nmap -sC -sV -Pn -O -v --script vuln $ip -oX output.xml
    else
    	sleep 1
		echo ".'"
		sleep 1
		echo ".'"
        echo "$ip is offline/niet bereikbaar\n"
    fi
sleep 5
echo "."
sleep 0.5 
echo "."
sleep 0.5
echo "Lees de output zorgvuldig. De scan geeft open ports, OS informatie en daar aan gelinkte CVE en vulns om direct te onderzoeken en te gebruiken."
