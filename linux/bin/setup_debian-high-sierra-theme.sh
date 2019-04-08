#/bin/bash
# update
sudo apt-get update
sudo apt-get upgrade

# install
sudo apt-get install -y git curl
sudo apt-get install -y dirmngr

# theme clone
mkdir ~/.themes
cd ~/.themes
git clone https://github.com/B00merang-Project/macOS-Sierra/

# add to gpgkey
#sudo su -
#gpg --keyserver pgp.mit.edu --recv-keys 52B709720F164EEB
#gpg -a --export 52B709720F164EEB | apt-key add -
#exit
#sudo add-apt-repository ppa:numix/ppa
#sudo apt-get update
sudo apt-get install numix-icon-theme-circle
curl https://raw.githubusercontent.com/ActusOS/GnomeYosemiteIcons/master/download_from_github.sh | sh
sudo apt-get install plank
sudo apt-get install gnome-tweak-tool
