#!/bin/bash
#installs
sudo apt-get update;
sudo apt-get install vim lxterminal build-essential mingw-w64 python-pip libssl-dev libffi-dev python-dev 
sudo -H pip install ansible==2.1;
#additions to bashrc
echo '
#bash on windows does not respect values set in /etc/login.defs
umask 002

#################DOCKER################
eval $("docker-machine.exe" env --shell bash);
export DOCKER_CERT_PATH=$(awk -F : '{ gsub("\\","/", $2 ); print "/"tolower($1)$2 }' <<< $DOCKER_CERT_PATH);

' >>~/.bashrc;

source ~/.bashrc;

#fixes dbus issue with terminator
sudo sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf;

#change default editor
sudo update-alternatives --config editor;


