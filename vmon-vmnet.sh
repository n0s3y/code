#On a linux distributions (all ubuntu based but also #fedora based) make use of vmmon and vmnet #modules to #make the emulation succesful on VMware workstation. 

#Since VMWare Workstation 15.0 til the current version #16.2.1 users on linux distro's (named #above) have to #manually inject the vmmon and vmnet modules into the #kernel so that Vmware 
#Workstation can be run.

git clone https://github.com/mkubecek/vmware-host-modules.git

cd vmware-host-modules

git checkout workstation-16.2.3
#for updates do; git checkout #workstation-"your-vmware-version" and proceed steps

make

sudo make install

sudo /etc/init.d/vmware start

#You should be done. Modules should be compiled and #injected. Open VMWare workstation
