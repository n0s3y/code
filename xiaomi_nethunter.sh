#automated xiamo redmi note 7 pro NetHunter intsallation & fastboot
sudo apt-get install git || exit 
git clone https://gitlab.com/ubports/community-ports/android9/xiaomi-redmi-note-7-pro/xiaomi-violet.git || exit

./build.sh -b bd  # bd is the name of the build directory 
./build/prepare-fake-ota.sh out/device_violet.tar.xz ota
./build/system-image-from-ota.sh ota/ubuntu_command out

#installeer fastboot
sudo apt install fastboot || exit

#fastboot de img naar je device
fastboot flash boot out/boot.img || exit
fastboot flash system out/system.img || exit
