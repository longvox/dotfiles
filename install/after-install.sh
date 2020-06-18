rm -rf *.deb.*
rm -rf *.deb
rm -rf *.appimage
rm -rf *.appimage.*
rm -rf autojump/

sudo du -sh /var/cache/apt/archives
sudo du -sh /var/cache/apt
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get autoclean
