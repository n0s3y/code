#!/bin/bash
#start of program
echo " ============ Eat like a Bear, sting like a Bee ============"
sleep 2
echo "Als FirmAE nog niet geinstalleert is, kies dan voor optie 1. Als het geinstalleert is, start mij opnieuw en voer optie 2 uit om alles werkend te krijgen."
sleep 3
echo "Reminder; elke keer als je dit script start zorg ik ervoor dat jouw kali sources.list juist is."
echo "deb http://http.kali.org/kali kali-last-snapshot main contrib non-free" | sudo tee /etc/apt/sources.list && sudo apt update
echo "Wat wil je doen? 1. Installeer FirmAE, 2 Fix FirmAE"
printf -- 'lets go... \n';
sleep 3

read input
if [[ $input == "1" || $input == "install" ]]; 
then
	printf -- '\033[32m SUCCESS: installatie van FirmAE begint... \033[0m\n';
	git clone --recursive https://github.com/pr0v3rbs/FirmAE
	cd FirmAE
	./download.sh
	./install.sh
     
elif [[ $input == "2" || $input == "fix" ]]; 
then
	printf -- '\033[33m WARNING: dit is best wel gevaarlijk, onderbreek de fix dus niet. \033[0m\n';
	cd ~/FirmAE
	sed -i '445,+2 s/"-e", "-r", "-C",/"--run-as=root", "-e", "-r", "C",/gi' ~/FirmAE/sources/extractor/extractor.py
	cd ~/FirmAE && pwd && wget https://github.com/ReFirmLabs/binwalk/archive/refs/tags/v2.3.1.tar.gz && tar -xf v2.3.1.tar.gz && cd binwalk-2.3.1 
	sed -i '46,+1 s/qt5base-dev/qtbase5-dev/g' /home/kali/FirmAE/binwalk-2.3.1/deps.sh
	sed -i '86,+5 s/(cd/#(cd/gi' /home/kali/FirmAE/binwalk-2.3.1/deps.sh
	sed -i '86,+5 s/git/#git/gi' /home/kali/FirmAE/binwalk-2.3.1/deps.sh
	sed -i '86,+5 s/$SUDO/#/gi' /home/kali/FirmAE/binwalk-2.3.1/deps.sh
	wget https://raw.githubusercontent.com/n0s3y/KaliLinux_fixes/main/extractor.py && cp extractor.py ~/FirmAE/sources/extractor/
	echo "echo PATH=/home/kali/.local/bin:$PATH" > ~/.zshrc
	source ~/.zshrc
	sudo rm -rf /FirmAE/scratch
fi
sleep 1

echo "============ Als je voor optie 1 hebt gekozen; start mij opnieuw op en kies voor optie 2. Als je deze beiden hebt gedaan; hier scheiden onze wegen, goodbye! ==============="

sleep 1

printf -- '\n';
exit 0;