#!/bin/bash
#MickBeer
#Googles input of file hierarchy current directory
sudo apt install tree 
sudo apt-get install dictd
sudo wget https://github.com/jarun/googler/releases/download/v4.3.2/googler_4.3.2-1_ubuntu20.04.amd64.deb
sudo apt install ./googler_4.3.2-1_ubuntu20.04.amd64.deb
sleep 1
echo "."
sleep 1
echo "."
echo "navigeer naar de folder van de uitgepakte firmware dmv binwalk -e"
echo "Nu zal hierarchisch de firmware worden weergegeven en deze componenten automatisch gezocht worden op de betekenis ervan. Mocht hier niks uitkomen, zoek de componenten dan handmatig."
echo "Sta je op dit moment in de folder van de uitgepakte firmware?  [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        tree . | googler --colorize -x 
		tree
else
        echo "Je hebt gekozen voor 'n'"
fi

#fin
