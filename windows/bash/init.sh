#!/bin/bash
#installs
sudo apt-get update;
sudo apt-get install vim lxterminal build-essential mingw-w64 python-pip libssl-dev libffi-dev python-dev 
sudo -H pip install ansible==2.1;
#additions to bashrc
echo "
#bash on windows does not respect values set in /etc/login.defs
umask 002
" >>~/.bashrc;

source ~/.bashrc;

#install apt-vim
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh;

source ~/.bashrc;

apt-vim install -y https://github.com/scrooloose/nerdtree.git

echo '
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set number
set fileformats=unix
set mouse=n
set ttymouse=xterm2
' >> ~/.vimrc

#fixes dbus issue with terminator
sudo sed -i 's$<listen>.*</listen>$<listen>tcp:host=localhost,port=0</listen>$' /etc/dbus-1/session.conf;

#change default editor
sudo update-alternatives --config editor;


